; DESCRIPTION: Places a blue 55x23 rectangle at position (145, 98).
; PLAN: r0=145(x), r1=98(y), r2=55(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 98
LDI r2, 55
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
