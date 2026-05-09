; DESCRIPTION: Places a magenta 115x29 rectangle at position (48, 188).
; PLAN: r0=48(x), r1=188(y), r2=115(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 188
LDI r2, 115
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
