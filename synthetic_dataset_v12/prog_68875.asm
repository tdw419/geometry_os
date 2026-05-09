; DESCRIPTION: Creates a green rectangular region at (143, 116) spanning 98 by 54 pixels.
; PLAN: r0=143(x), r1=116(y), r2=98(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 116
LDI r2, 98
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
