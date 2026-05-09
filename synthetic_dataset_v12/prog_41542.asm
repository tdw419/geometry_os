; DESCRIPTION: Creates a white rectangular region at (225, 26) spanning 64 by 91 pixels.
; PLAN: r0=225(x), r1=26(y), r2=64(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 26
LDI r2, 64
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
