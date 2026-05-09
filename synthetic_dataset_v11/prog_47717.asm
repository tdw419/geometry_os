; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (196, 46) with width 16 and height 98. Then Creates a orange circular shape at (182, 111) with radius 44.
; PLAN: r0=196(x), r1=46(y), r2=16(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=182(x), r1=111(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (196, 46) with width 16 and height 98.
; PLAN: r0=196(x), r1=46(y), r2=16(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 46
LDI r2, 16
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (182, 111) with radius 44.
; PLAN: r0=182(x), r1=111(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 111
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
