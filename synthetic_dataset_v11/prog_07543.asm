; DESCRIPTION: Places a blue 101x56 rectangle at position (79, 50).
; PLAN: r0=79(x), r1=50(y), r2=101(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 50
LDI r2, 101
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
