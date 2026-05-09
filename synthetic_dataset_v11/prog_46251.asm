; DESCRIPTION: Composite: . Then Renders a yellow line between points (2, 7) and (125, 218). Then Creates a cyan circular shape at (178, 50) with radius 49.
; PLAN: r0=2(x1), r1=7(y1), r2=125(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=50(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (2, 7) and (125, 218).
; PLAN: r0=2(x1), r1=7(y1), r2=125(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 7
LDI r2, 125
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (178, 50) with radius 49.
; PLAN: r0=178(x), r1=50(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 50
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
