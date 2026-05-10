; DESCRIPTION: Creates a yellow rectangular region at (358, 94) spanning 113 by 109 pixels.
; PLAN: r0=358(x), r1=94(y), r2=113(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 94
LDI r2, 113
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
