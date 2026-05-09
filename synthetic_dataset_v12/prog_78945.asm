; DESCRIPTION: Creates a white rectangular region at (13, 188) spanning 113 by 46 pixels.
; PLAN: r0=13(x), r1=188(y), r2=113(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 188
LDI r2, 113
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
