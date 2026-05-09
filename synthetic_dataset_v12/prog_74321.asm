; DESCRIPTION: Creates a blue rectangular region at (127, 237) spanning 24 by 16 pixels.
; PLAN: r0=127(x), r1=237(y), r2=24(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 237
LDI r2, 24
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
