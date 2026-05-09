; DESCRIPTION: Creates a white rectangular region at (104, 36) spanning 94 by 93 pixels.
; PLAN: r0=104(x), r1=36(y), r2=94(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 36
LDI r2, 94
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
