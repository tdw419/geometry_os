; DESCRIPTION: Composite: . Then Places a orange 32x112 rectangle at position (102, 138). Then Draws a yellow circle centered at (120, 60) with radius 56.
; PLAN: r0=102(x), r1=138(y), r2=32(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x), r1=60(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 32x112 rectangle at position (102, 138).
; PLAN: r0=102(x), r1=138(y), r2=32(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 138
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (120, 60) with radius 56.
; PLAN: r0=120(x), r1=60(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 60
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
