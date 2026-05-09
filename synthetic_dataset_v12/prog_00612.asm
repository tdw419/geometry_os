; DESCRIPTION: Creates a blue rectangular region at (434, 195) spanning 51 by 26 pixels.
; PLAN: r0=434(x), r1=195(y), r2=51(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 195
LDI r2, 51
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
