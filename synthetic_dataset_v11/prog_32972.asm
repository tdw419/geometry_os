; DESCRIPTION: Places a purple 30x65 rectangle at position (159, 144).
; PLAN: r0=159(x), r1=144(y), r2=30(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 144
LDI r2, 30
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
