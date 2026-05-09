; DESCRIPTION: Creates a white rectangular region at (356, 25) spanning 32 by 58 pixels.
; PLAN: r0=356(x), r1=25(y), r2=32(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 25
LDI r2, 32
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
