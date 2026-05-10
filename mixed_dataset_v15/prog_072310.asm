; DESCRIPTION: Creates a blue rectangular region at (146, 97) spanning 46 by 11 pixels.
; PLAN: r0=146(x), r1=97(y), r2=46(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 97
LDI r2, 46
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
