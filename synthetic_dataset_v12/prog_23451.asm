; DESCRIPTION: Creates a red rectangular region at (164, 113) spanning 39 by 71 pixels.
; PLAN: r0=164(x), r1=113(y), r2=39(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 113
LDI r2, 39
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
