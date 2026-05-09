; DESCRIPTION: Composite: . Then Renders a cyan disk with center (156, 207) and radius 21. Then Places a cyan line segment connecting (254, 104) to (247, 78).
; PLAN: r0=156(x), r1=207(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x1), r1=104(y1), r2=247(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (156, 207) and radius 21.
; PLAN: r0=156(x), r1=207(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 207
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (254, 104) to (247, 78).
; PLAN: r0=254(x1), r1=104(y1), r2=247(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 104
LDI r2, 247
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
