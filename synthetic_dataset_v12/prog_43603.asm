; DESCRIPTION: Places a blue 31x54 rectangle at position (50, 72).
; PLAN: r0=50(x), r1=72(y), r2=31(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 72
LDI r2, 31
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
