; DESCRIPTION: Creates a red rectangular region at (339, 27) spanning 44 by 109 pixels.
; PLAN: r0=339(x), r1=27(y), r2=44(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 27
LDI r2, 44
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
