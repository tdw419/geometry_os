; DESCRIPTION: Renders a blue line between points (152, 195) and (416, 128).
; PLAN: r0=152(x1), r1=195(y1), r2=416(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 195
LDI r2, 416
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
