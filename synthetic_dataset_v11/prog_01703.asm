; DESCRIPTION: Creates a white rectangular region at (30, 164) spanning 112 by 64 pixels.
; PLAN: r0=30(x), r1=164(y), r2=112(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 164
LDI r2, 112
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
