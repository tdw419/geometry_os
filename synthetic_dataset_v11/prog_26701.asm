; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (219, 220). Then Renders a green box of size 70x108 starting at (139, 84).
; PLAN: r0=219(x), r1=220(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=139(x), r1=84(y), r2=70(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (219, 220).
; PLAN: r0=219(x), r1=220(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 220
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 70x108 starting at (139, 84).
; PLAN: r0=139(x), r1=84(y), r2=70(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 84
LDI r2, 70
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
