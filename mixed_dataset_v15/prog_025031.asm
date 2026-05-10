; DESCRIPTION: Places a blue 82x96 rectangle at position (192, 144).
; PLAN: r0=192(x), r1=144(y), r2=82(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 144
LDI r2, 82
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
