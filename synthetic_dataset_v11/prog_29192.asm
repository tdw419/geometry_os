; DESCRIPTION: Composite: . Then Creates a orange circular shape at (81, 101) with radius 74. Then Places a orange 99x86 rectangle at position (121, 89).
; PLAN: r0=81(x), r1=101(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=89(y), r2=99(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (81, 101) with radius 74.
; PLAN: r0=81(x), r1=101(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 101
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 99x86 rectangle at position (121, 89).
; PLAN: r0=121(x), r1=89(y), r2=99(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 89
LDI r2, 99
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
