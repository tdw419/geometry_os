; DESCRIPTION: Creates a blue rectangular region at (150, 16) spanning 81 by 18 pixels.
; PLAN: r0=150(x), r1=16(y), r2=81(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 16
LDI r2, 81
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
