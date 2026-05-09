; DESCRIPTION: Composite: . Then Places a purple line segment connecting (224, 55) to (218, 128). Then Places a green circle of radius 39 at center (121, 83).
; PLAN: r0=224(x1), r1=55(y1), r2=218(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=121(x), r1=83(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (224, 55) to (218, 128).
; PLAN: r0=224(x1), r1=55(y1), r2=218(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 55
LDI r2, 218
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 39 at center (121, 83).
; PLAN: r0=121(x), r1=83(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 83
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
