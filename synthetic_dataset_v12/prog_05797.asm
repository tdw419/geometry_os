; DESCRIPTION: Places a blue 96x37 rectangle at position (39, 107).
; PLAN: r0=39(x), r1=107(y), r2=96(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 107
LDI r2, 96
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
