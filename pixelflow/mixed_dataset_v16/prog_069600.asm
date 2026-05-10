; DESCRIPTION: Places a magenta 24x37 rectangle at position (168, 23).
; PLAN: r0=168(x), r1=23(y), r2=24(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 23
LDI r2, 24
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
