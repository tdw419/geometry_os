; DESCRIPTION: Places a blue 49x21 rectangle at position (50, 79).
; PLAN: r0=50(x), r1=79(y), r2=49(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 79
LDI r2, 49
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
