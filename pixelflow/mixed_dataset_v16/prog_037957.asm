; DESCRIPTION: Renders a yellow line segment connecting (197, 31) to (271, 138).
; PLAN: r0=197(x1), r1=31(y1), r2=271(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 31
LDI r2, 271
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
