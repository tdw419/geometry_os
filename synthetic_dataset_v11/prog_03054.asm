; DESCRIPTION: Places a blue 23x92 rectangle at position (172, 76).
; PLAN: r0=172(x), r1=76(y), r2=23(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 76
LDI r2, 23
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
