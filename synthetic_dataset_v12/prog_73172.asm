; DESCRIPTION: Renders a blue line between points (243, 175) and (239, 98).
; PLAN: r0=243(x1), r1=175(y1), r2=239(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 175
LDI r2, 239
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
