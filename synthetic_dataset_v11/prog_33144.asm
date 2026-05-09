; DESCRIPTION: Composite: . Then Places a red circle of radius 70 at center (114, 112). Then Renders a cyan box of size 119x43 starting at (83, 188).
; PLAN: r0=114(x), r1=112(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=83(x), r1=188(y), r2=119(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 70 at center (114, 112).
; PLAN: r0=114(x), r1=112(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 112
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 119x43 starting at (83, 188).
; PLAN: r0=83(x), r1=188(y), r2=119(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 188
LDI r2, 119
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
