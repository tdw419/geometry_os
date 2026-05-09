; DESCRIPTION: Creates a white rectangular region at (16, 94) spanning 25 by 92 pixels.
; PLAN: r0=16(x), r1=94(y), r2=25(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 94
LDI r2, 25
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
