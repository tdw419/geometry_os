; DESCRIPTION: Creates a white rectangular region at (299, 208) spanning 54 by 32 pixels.
; PLAN: r0=299(x), r1=208(y), r2=54(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 208
LDI r2, 54
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
