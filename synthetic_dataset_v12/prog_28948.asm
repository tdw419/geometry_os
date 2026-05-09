; DESCRIPTION: Creates a white rectangular region at (177, 141) spanning 66 by 113 pixels.
; PLAN: r0=177(x), r1=141(y), r2=66(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 141
LDI r2, 66
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
