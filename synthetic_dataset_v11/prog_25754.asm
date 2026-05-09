; DESCRIPTION: Composite: . Then Places a orange 46x22 rectangle at position (89, 202). Then Creates a magenta circular shape at (93, 94) with radius 72.
; PLAN: r0=89(x), r1=202(y), r2=46(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=94(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 46x22 rectangle at position (89, 202).
; PLAN: r0=89(x), r1=202(y), r2=46(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 202
LDI r2, 46
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (93, 94) with radius 72.
; PLAN: r0=93(x), r1=94(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 94
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
