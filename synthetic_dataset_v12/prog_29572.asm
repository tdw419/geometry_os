; DESCRIPTION: Places a magenta 116x46 rectangle at position (336, 66).
; PLAN: r0=336(x), r1=66(y), r2=116(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 66
LDI r2, 116
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
