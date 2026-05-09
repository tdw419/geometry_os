; DESCRIPTION: Creates a white rectangular region at (226, 146) spanning 46 by 43 pixels.
; PLAN: r0=226(x), r1=146(y), r2=46(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 146
LDI r2, 46
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
