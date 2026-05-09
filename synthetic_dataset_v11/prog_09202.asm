; DESCRIPTION: Creates a white rectangular region at (32, 22) spanning 109 by 91 pixels.
; PLAN: r0=32(x), r1=22(y), r2=109(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 22
LDI r2, 109
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
