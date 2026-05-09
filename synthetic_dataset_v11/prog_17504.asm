; DESCRIPTION: Composite: . Then Places a green line segment connecting (126, 143) to (49, 225). Then Creates a green circular shape at (172, 83) with radius 57.
; PLAN: r0=126(x1), r1=143(y1), r2=49(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=172(x), r1=83(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (126, 143) to (49, 225).
; PLAN: r0=126(x1), r1=143(y1), r2=49(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 143
LDI r2, 49
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (172, 83) with radius 57.
; PLAN: r0=172(x), r1=83(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 83
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
