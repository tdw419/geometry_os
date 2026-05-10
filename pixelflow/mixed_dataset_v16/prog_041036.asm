; DESCRIPTION: Places a purple 83x81 rectangle at position (164, 107).
; PLAN: r0=164(x), r1=107(y), r2=83(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 107
LDI r2, 83
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
