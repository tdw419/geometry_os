; DESCRIPTION: Places a magenta 12x15 rectangle at position (173, 227).
; PLAN: r0=173(x), r1=227(y), r2=12(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 227
LDI r2, 12
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
