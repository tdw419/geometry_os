; DESCRIPTION: Places a blue 50x78 rectangle at position (177, 58).
; PLAN: r0=177(x), r1=58(y), r2=50(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 58
LDI r2, 50
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
