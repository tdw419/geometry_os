; DESCRIPTION: Places a magenta 27x85 rectangle at position (86, 84).
; PLAN: r0=86(x), r1=84(y), r2=27(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 84
LDI r2, 27
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
