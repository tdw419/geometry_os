; DESCRIPTION: Places a magenta 83x68 rectangle at position (119, 37).
; PLAN: r0=119(x), r1=37(y), r2=83(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 37
LDI r2, 83
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
