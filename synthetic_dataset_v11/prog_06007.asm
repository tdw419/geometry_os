; DESCRIPTION: Composite: . Then Renders a green box of size 45x16 starting at (62, 192). Then Draws a red circle centered at (164, 106) with radius 74.
; PLAN: r0=62(x), r1=192(y), r2=45(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=164(x), r1=106(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 45x16 starting at (62, 192).
; PLAN: r0=62(x), r1=192(y), r2=45(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 192
LDI r2, 45
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (164, 106) with radius 74.
; PLAN: r0=164(x), r1=106(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 106
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
