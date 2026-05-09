; DESCRIPTION: Places a blue 115x16 rectangle at position (177, 10).
; PLAN: r0=177(x), r1=10(y), r2=115(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 10
LDI r2, 115
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
