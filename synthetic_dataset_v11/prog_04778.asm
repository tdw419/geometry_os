; DESCRIPTION: Draws a white line from (164, 20) to (61, 128).
; PLAN: r0=164(x1), r1=20(y1), r2=61(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 20
LDI r2, 61
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
