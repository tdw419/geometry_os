; DESCRIPTION: Places a blue 107x60 rectangle at position (95, 178).
; PLAN: r0=95(x), r1=178(y), r2=107(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 178
LDI r2, 107
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
