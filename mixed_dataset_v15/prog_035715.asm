; DESCRIPTION: Places a magenta 82x118 rectangle at position (327, 123).
; PLAN: r0=327(x), r1=123(y), r2=82(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 123
LDI r2, 82
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
