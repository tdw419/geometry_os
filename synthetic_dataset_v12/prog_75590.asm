; DESCRIPTION: Places a magenta 109x21 rectangle at position (233, 100).
; PLAN: r0=233(x), r1=100(y), r2=109(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 100
LDI r2, 109
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
