; DESCRIPTION: Creates a blue rectangular region at (382, 125) spanning 27 by 74 pixels.
; PLAN: r0=382(x), r1=125(y), r2=27(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 125
LDI r2, 27
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
