; DESCRIPTION: Places a magenta 53x91 rectangle at position (86, 141).
; PLAN: r0=86(x), r1=141(y), r2=53(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 141
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
