; DESCRIPTION: Places a magenta 106x12 rectangle at position (352, 227).
; PLAN: r0=352(x), r1=227(y), r2=106(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 227
LDI r2, 106
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
