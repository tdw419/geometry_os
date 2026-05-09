; DESCRIPTION: Creates a blue rectangular region at (125, 9) spanning 74 by 50 pixels.
; PLAN: r0=125(x), r1=9(y), r2=74(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 9
LDI r2, 74
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
