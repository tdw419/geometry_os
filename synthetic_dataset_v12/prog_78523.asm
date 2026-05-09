; DESCRIPTION: Creates a white rectangular region at (215, 15) spanning 88 by 91 pixels.
; PLAN: r0=215(x), r1=15(y), r2=88(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 15
LDI r2, 88
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
