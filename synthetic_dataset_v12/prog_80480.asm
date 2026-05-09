; DESCRIPTION: Draws a white line from (368, 150) to (486, 128).
; PLAN: r0=368(x1), r1=150(y1), r2=486(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 150
LDI r2, 486
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
