; DESCRIPTION: Creates a white rectangular region at (24, 66) spanning 46 by 109 pixels.
; PLAN: r0=24(x), r1=66(y), r2=46(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 66
LDI r2, 46
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
