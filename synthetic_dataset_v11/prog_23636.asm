; DESCRIPTION: Creates a red rectangular region at (166, 61) spanning 10 by 67 pixels.
; PLAN: r0=166(x), r1=61(y), r2=10(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 61
LDI r2, 10
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
