; DESCRIPTION: Renders a green line between points (271, 171) and (170, 219).
; PLAN: r0=271(x1), r1=171(y1), r2=170(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 171
LDI r2, 170
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
