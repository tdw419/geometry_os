; DESCRIPTION: Places a magenta 19x36 rectangle at position (12, 174).
; PLAN: r0=12(x), r1=174(y), r2=19(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 174
LDI r2, 19
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
