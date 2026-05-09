; DESCRIPTION: Creates a red rectangular region at (178, 176) spanning 73 by 37 pixels.
; PLAN: r0=178(x), r1=176(y), r2=73(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 176
LDI r2, 73
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
