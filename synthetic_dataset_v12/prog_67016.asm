; DESCRIPTION: Creates a red rectangular region at (268, 113) spanning 66 by 17 pixels.
; PLAN: r0=268(x), r1=113(y), r2=66(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 113
LDI r2, 66
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
