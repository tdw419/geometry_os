; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (205, 39) with width 16 and height 18. Then Creates a orange circular shape at (221, 174) with radius 16.
; PLAN: r0=205(x), r1=39(y), r2=16(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=221(x), r1=174(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (205, 39) with width 16 and height 18.
; PLAN: r0=205(x), r1=39(y), r2=16(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 39
LDI r2, 16
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (221, 174) with radius 16.
; PLAN: r0=221(x), r1=174(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 174
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
