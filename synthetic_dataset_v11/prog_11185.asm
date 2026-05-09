; DESCRIPTION: Creates a white rectangular region at (23, 58) spanning 40 by 16 pixels.
; PLAN: r0=23(x), r1=58(y), r2=40(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 58
LDI r2, 40
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
