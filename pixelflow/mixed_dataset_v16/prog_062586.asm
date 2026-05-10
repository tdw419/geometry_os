; DESCRIPTION: Places a magenta 56x39 rectangle at position (86, 0).
; PLAN: r0=86(x), r1=0(y), r2=56(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 0
LDI r2, 56
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
