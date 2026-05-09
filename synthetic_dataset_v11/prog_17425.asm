; DESCRIPTION: Draws a blue line from (124, 130) to (239, 165).
; PLAN: r0=124(x1), r1=130(y1), r2=239(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 130
LDI r2, 239
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
