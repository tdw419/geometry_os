; DESCRIPTION: Places a magenta 85x24 rectangle at position (185, 52).
; PLAN: r0=185(x), r1=52(y), r2=85(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 52
LDI r2, 85
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
