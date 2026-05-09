; DESCRIPTION: Places a magenta 16x43 rectangle at position (172, 16).
; PLAN: r0=172(x), r1=16(y), r2=16(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 16
LDI r2, 16
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
