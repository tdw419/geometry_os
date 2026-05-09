; DESCRIPTION: Places a blue 85x30 rectangle at position (78, 172).
; PLAN: r0=78(x), r1=172(y), r2=85(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 172
LDI r2, 85
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
