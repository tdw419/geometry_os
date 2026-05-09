; DESCRIPTION: Creates a white rectangular region at (32, 44) spanning 64 by 18 pixels.
; PLAN: r0=32(x), r1=44(y), r2=64(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 44
LDI r2, 64
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
