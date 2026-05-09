; DESCRIPTION: Creates a red rectangular region at (152, 183) spanning 90 by 12 pixels.
; PLAN: r0=152(x), r1=183(y), r2=90(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 183
LDI r2, 90
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
