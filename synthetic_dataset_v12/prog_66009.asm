; DESCRIPTION: Creates a white rectangular region at (328, 56) spanning 98 by 91 pixels.
; PLAN: r0=328(x), r1=56(y), r2=98(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 56
LDI r2, 98
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
