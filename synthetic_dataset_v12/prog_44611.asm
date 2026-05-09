; DESCRIPTION: Places a magenta 73x95 rectangle at position (364, 141).
; PLAN: r0=364(x), r1=141(y), r2=73(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 141
LDI r2, 73
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
