; DESCRIPTION: Creates a white rectangular region at (168, 64) spanning 56 by 51 pixels.
; PLAN: r0=168(x), r1=64(y), r2=56(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 64
LDI r2, 56
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
