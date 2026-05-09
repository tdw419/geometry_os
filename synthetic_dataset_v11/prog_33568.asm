; DESCRIPTION: Places a blue 24x81 rectangle at position (195, 144).
; PLAN: r0=195(x), r1=144(y), r2=24(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 144
LDI r2, 24
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
