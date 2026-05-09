; DESCRIPTION: Creates a black rectangular region at (263, 113) spanning 74 by 94 pixels.
; PLAN: r0=263(x), r1=113(y), r2=74(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 113
LDI r2, 74
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
