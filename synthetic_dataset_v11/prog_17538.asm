; DESCRIPTION: Draws a purple line from (242, 210) to (254, 63).
; PLAN: r0=242(x1), r1=210(y1), r2=254(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 210
LDI r2, 254
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
