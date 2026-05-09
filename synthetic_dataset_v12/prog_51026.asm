; DESCRIPTION: Creates a white rectangular region at (444, 187) spanning 38 by 68 pixels.
; PLAN: r0=444(x), r1=187(y), r2=38(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 187
LDI r2, 38
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
