; DESCRIPTION: Creates a red rectangular region at (324, 53) spanning 109 by 10 pixels.
; PLAN: r0=324(x), r1=53(y), r2=109(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 53
LDI r2, 109
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
