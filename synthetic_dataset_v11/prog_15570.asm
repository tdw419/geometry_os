; DESCRIPTION: Composite: . Then Renders a black disk with center (193, 170) and radius 35. Then Renders a cyan box of size 70x55 starting at (111, 104).
; PLAN: r0=193(x), r1=170(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=111(x), r1=104(y), r2=70(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (193, 170) and radius 35.
; PLAN: r0=193(x), r1=170(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 170
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 70x55 starting at (111, 104).
; PLAN: r0=111(x), r1=104(y), r2=70(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 104
LDI r2, 70
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
