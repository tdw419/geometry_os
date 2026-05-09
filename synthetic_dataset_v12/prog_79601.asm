; DESCRIPTION: Creates a red rectangular region at (136, 3) spanning 29 by 113 pixels.
; PLAN: r0=136(x), r1=3(y), r2=29(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 3
LDI r2, 29
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
