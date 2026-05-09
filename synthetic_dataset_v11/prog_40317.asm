; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (99, 167) with width 23 and height 53. Then Places a magenta circle of radius 75 at center (154, 150).
; PLAN: r0=99(x), r1=167(y), r2=23(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=154(x), r1=150(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (99, 167) with width 23 and height 53.
; PLAN: r0=99(x), r1=167(y), r2=23(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 167
LDI r2, 23
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 75 at center (154, 150).
; PLAN: r0=154(x), r1=150(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
