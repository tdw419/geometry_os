; DESCRIPTION: Creates a white rectangular region at (320, 126) spanning 65 by 44 pixels.
; PLAN: r0=320(x), r1=126(y), r2=65(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 126
LDI r2, 65
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
