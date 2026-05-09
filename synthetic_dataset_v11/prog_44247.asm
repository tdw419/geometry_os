; DESCRIPTION: Places a purple 40x107 rectangle at position (188, 140).
; PLAN: r0=188(x), r1=140(y), r2=40(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 140
LDI r2, 40
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
