; DESCRIPTION: Places a blue 107x19 rectangle at position (225, 194).
; PLAN: r0=225(x), r1=194(y), r2=107(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 194
LDI r2, 107
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
