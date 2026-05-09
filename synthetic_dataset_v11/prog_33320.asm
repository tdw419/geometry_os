; DESCRIPTION: Composite: . Then Renders a cyan box of size 22x70 starting at (22, 93). Then Draws a purple circle centered at (101, 22) with radius 10.
; PLAN: r0=22(x), r1=93(y), r2=22(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=22(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 22x70 starting at (22, 93).
; PLAN: r0=22(x), r1=93(y), r2=22(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 93
LDI r2, 22
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (101, 22) with radius 10.
; PLAN: r0=101(x), r1=22(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 22
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
