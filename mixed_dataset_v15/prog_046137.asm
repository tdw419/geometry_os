; DESCRIPTION: Creates a blue rectangular region at (235, 39) spanning 25 by 41 pixels.
; PLAN: r0=235(x), r1=39(y), r2=25(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 39
LDI r2, 25
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
