; DESCRIPTION: Places a magenta 55x100 rectangle at position (116, 43).
; PLAN: r0=116(x), r1=43(y), r2=55(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 43
LDI r2, 55
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
