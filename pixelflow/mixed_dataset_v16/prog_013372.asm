; DESCRIPTION: Creates a white rectangular region at (309, 242) spanning 22 by 14 pixels.
; PLAN: r0=309(x), r1=242(y), r2=22(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 242
LDI r2, 22
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
