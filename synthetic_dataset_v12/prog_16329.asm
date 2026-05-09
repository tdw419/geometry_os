; DESCRIPTION: Creates a white rectangular region at (130, 64) spanning 12 by 48 pixels.
; PLAN: r0=130(x), r1=64(y), r2=12(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 64
LDI r2, 12
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
