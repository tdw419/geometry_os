; DESCRIPTION: Places a magenta 62x103 rectangle at position (194, 146).
; PLAN: r0=194(x), r1=146(y), r2=62(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 146
LDI r2, 62
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
