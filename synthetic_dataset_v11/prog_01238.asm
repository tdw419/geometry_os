; DESCRIPTION: Creates a red rectangular region at (100, 130) spanning 56 by 64 pixels.
; PLAN: r0=100(x), r1=130(y), r2=56(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 130
LDI r2, 56
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
