; DESCRIPTION: Places a magenta 50x61 rectangle at position (253, 43).
; PLAN: r0=253(x), r1=43(y), r2=50(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 43
LDI r2, 50
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
