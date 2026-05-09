; DESCRIPTION: Places a magenta 50x66 rectangle at position (185, 15).
; PLAN: r0=185(x), r1=15(y), r2=50(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 15
LDI r2, 50
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
