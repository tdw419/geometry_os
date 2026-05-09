; DESCRIPTION: Creates a white rectangular region at (230, 10) spanning 48 by 32 pixels.
; PLAN: r0=230(x), r1=10(y), r2=48(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 10
LDI r2, 48
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
