; DESCRIPTION: Places a blue 50x14 rectangle at position (411, 107).
; PLAN: r0=411(x), r1=107(y), r2=50(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 107
LDI r2, 50
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
