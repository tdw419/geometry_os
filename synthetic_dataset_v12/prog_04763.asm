; DESCRIPTION: Creates a red rectangular region at (54, 74) spanning 43 by 27 pixels.
; PLAN: r0=54(x), r1=74(y), r2=43(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 74
LDI r2, 43
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
