; DESCRIPTION: Creates a red rectangular region at (85, 49) spanning 27 by 59 pixels.
; PLAN: r0=85(x), r1=49(y), r2=27(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 49
LDI r2, 27
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
