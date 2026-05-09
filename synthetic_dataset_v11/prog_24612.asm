; DESCRIPTION: Composite: . Then Places a green 17x60 rectangle at position (190, 65). Then Creates a orange circular shape at (123, 68) with radius 46.
; PLAN: r0=190(x), r1=65(y), r2=17(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=123(x), r1=68(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 17x60 rectangle at position (190, 65).
; PLAN: r0=190(x), r1=65(y), r2=17(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 65
LDI r2, 17
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (123, 68) with radius 46.
; PLAN: r0=123(x), r1=68(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 68
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
