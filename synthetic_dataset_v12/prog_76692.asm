; DESCRIPTION: Places a magenta 83x119 rectangle at position (157, 18).
; PLAN: r0=157(x), r1=18(y), r2=83(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 18
LDI r2, 83
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
