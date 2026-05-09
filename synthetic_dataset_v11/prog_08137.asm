; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (20, 138) to (90, 251). Then Creates a cyan circular shape at (203, 72) with radius 40.
; PLAN: r0=20(x1), r1=138(y1), r2=90(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=203(x), r1=72(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (20, 138) to (90, 251).
; PLAN: r0=20(x1), r1=138(y1), r2=90(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 138
LDI r2, 90
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (203, 72) with radius 40.
; PLAN: r0=203(x), r1=72(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 72
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
