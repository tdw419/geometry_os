; DESCRIPTION: Creates a white rectangular region at (116, 8) spanning 91 by 50 pixels.
; PLAN: r0=116(x), r1=8(y), r2=91(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 8
LDI r2, 91
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
