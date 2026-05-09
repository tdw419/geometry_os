; DESCRIPTION: Creates a red rectangular region at (239, 27) spanning 72 by 115 pixels.
; PLAN: r0=239(x), r1=27(y), r2=72(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 27
LDI r2, 72
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
