; DESCRIPTION: Creates a white rectangular region at (197, 4) spanning 36 by 31 pixels.
; PLAN: r0=197(x), r1=4(y), r2=36(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 4
LDI r2, 36
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
