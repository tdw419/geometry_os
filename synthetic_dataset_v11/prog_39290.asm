; DESCRIPTION: Creates a white rectangular region at (177, 4) spanning 16 by 53 pixels.
; PLAN: r0=177(x), r1=4(y), r2=16(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 4
LDI r2, 16
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
