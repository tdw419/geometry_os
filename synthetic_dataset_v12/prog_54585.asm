; DESCRIPTION: Places a magenta 68x66 rectangle at position (206, 115).
; PLAN: r0=206(x), r1=115(y), r2=68(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 115
LDI r2, 68
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
