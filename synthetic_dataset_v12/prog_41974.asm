; DESCRIPTION: Places a blue 15x11 rectangle at position (434, 90).
; PLAN: r0=434(x), r1=90(y), r2=15(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 90
LDI r2, 15
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
