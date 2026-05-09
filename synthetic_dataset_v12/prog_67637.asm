; DESCRIPTION: Creates a white rectangular region at (320, 168) spanning 73 by 13 pixels.
; PLAN: r0=320(x), r1=168(y), r2=73(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 168
LDI r2, 73
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
