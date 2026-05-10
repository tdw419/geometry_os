; DESCRIPTION: Places a blue 107x97 rectangle at position (96, 82).
; PLAN: r0=96(x), r1=82(y), r2=107(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 82
LDI r2, 107
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
