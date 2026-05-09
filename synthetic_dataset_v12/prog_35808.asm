; DESCRIPTION: Creates a red rectangular region at (425, 27) spanning 76 by 106 pixels.
; PLAN: r0=425(x), r1=27(y), r2=76(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 27
LDI r2, 76
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
