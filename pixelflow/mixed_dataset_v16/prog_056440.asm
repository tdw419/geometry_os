; DESCRIPTION: Draws a green line from (172, 219) to (120, 193).
; PLAN: r0=172(x1), r1=219(y1), r2=120(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 219
LDI r2, 120
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
