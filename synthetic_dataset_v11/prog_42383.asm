; DESCRIPTION: Creates a red rectangular region at (94, 98) spanning 113 by 28 pixels.
; PLAN: r0=94(x), r1=98(y), r2=113(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 98
LDI r2, 113
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
