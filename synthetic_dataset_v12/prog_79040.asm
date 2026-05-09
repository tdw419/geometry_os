; DESCRIPTION: Draws a white line from (18, 2) to (307, 4).
; PLAN: r0=18(x1), r1=2(y1), r2=307(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 2
LDI r2, 307
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
