; DESCRIPTION: Draws a white line from (408, 30) to (166, 21).
; PLAN: r0=408(x1), r1=30(y1), r2=166(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 30
LDI r2, 166
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
