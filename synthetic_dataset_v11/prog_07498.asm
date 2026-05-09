; DESCRIPTION: Places a blue 71x45 rectangle at position (164, 119).
; PLAN: r0=164(x), r1=119(y), r2=71(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 119
LDI r2, 71
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
