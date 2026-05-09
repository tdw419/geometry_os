; DESCRIPTION: Places a magenta 15x96 rectangle at position (204, 12).
; PLAN: r0=204(x), r1=12(y), r2=15(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 12
LDI r2, 15
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
