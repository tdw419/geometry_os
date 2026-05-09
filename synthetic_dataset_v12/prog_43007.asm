; DESCRIPTION: Creates a red rectangular region at (426, 130) spanning 68 by 36 pixels.
; PLAN: r0=426(x), r1=130(y), r2=68(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 130
LDI r2, 68
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
