; DESCRIPTION: Composite: . Then Renders a green box of size 23x24 starting at (126, 72). Then Renders a cyan disk with center (108, 99) and radius 70.
; PLAN: r0=126(x), r1=72(y), r2=23(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=99(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 23x24 starting at (126, 72).
; PLAN: r0=126(x), r1=72(y), r2=23(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 72
LDI r2, 23
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (108, 99) and radius 70.
; PLAN: r0=108(x), r1=99(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 99
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
