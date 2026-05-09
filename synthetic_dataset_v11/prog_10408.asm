; DESCRIPTION: Creates a blue rectangular region at (4, 98) spanning 113 by 34 pixels.
; PLAN: r0=4(x), r1=98(y), r2=113(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 98
LDI r2, 113
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
