; DESCRIPTION: Draws a green line from (5, 220) to (1, 64).
; PLAN: r0=5(x1), r1=220(y1), r2=1(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 220
LDI r2, 1
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
