; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (85, 103) with radius 68. Then Places a green 44x102 rectangle at position (27, 125).
; PLAN: r0=85(x), r1=103(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x), r1=125(y), r2=44(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (85, 103) with radius 68.
; PLAN: r0=85(x), r1=103(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 103
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 44x102 rectangle at position (27, 125).
; PLAN: r0=27(x), r1=125(y), r2=44(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 125
LDI r2, 44
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
