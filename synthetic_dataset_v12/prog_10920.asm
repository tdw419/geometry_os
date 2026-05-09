; DESCRIPTION: Places a blue line segment connecting (152, 226) to (144, 143).
; PLAN: r0=152(x1), r1=226(y1), r2=144(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 226
LDI r2, 144
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
