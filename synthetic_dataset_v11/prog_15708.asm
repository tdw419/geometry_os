; DESCRIPTION: Places a blue line segment connecting (122, 154) to (213, 27).
; PLAN: r0=122(x1), r1=154(y1), r2=213(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 154
LDI r2, 213
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
