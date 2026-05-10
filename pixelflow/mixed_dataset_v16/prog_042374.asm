; DESCRIPTION: Creates a white rectangular region at (253, 168) spanning 89 by 81 pixels.
; PLAN: r0=253(x), r1=168(y), r2=89(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 168
LDI r2, 89
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
