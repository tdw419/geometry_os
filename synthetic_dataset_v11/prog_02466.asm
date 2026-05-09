; DESCRIPTION: Places a magenta 20x86 rectangle at position (159, 2).
; PLAN: r0=159(x), r1=2(y), r2=20(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 2
LDI r2, 20
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
