; DESCRIPTION: Composite: . Then Draws a orange rectangle at (21, 28) with width 99 and height 38. Then Draws a black circle centered at (168, 127) with radius 49.
; PLAN: r0=21(x), r1=28(y), r2=99(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=168(x), r1=127(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (21, 28) with width 99 and height 38.
; PLAN: r0=21(x), r1=28(y), r2=99(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 28
LDI r2, 99
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (168, 127) with radius 49.
; PLAN: r0=168(x), r1=127(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 127
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
