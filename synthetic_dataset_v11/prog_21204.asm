; DESCRIPTION: Composite: . Then Places a green line segment connecting (75, 226) to (152, 186). Then Places a purple circle of radius 48 at center (192, 87).
; PLAN: r0=75(x1), r1=226(y1), r2=152(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=87(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (75, 226) to (152, 186).
; PLAN: r0=75(x1), r1=226(y1), r2=152(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 226
LDI r2, 152
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 48 at center (192, 87).
; PLAN: r0=192(x), r1=87(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 87
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
