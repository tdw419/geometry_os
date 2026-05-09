; DESCRIPTION: Creates a white rectangular region at (165, 80) spanning 53 by 16 pixels.
; PLAN: r0=165(x), r1=80(y), r2=53(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 80
LDI r2, 53
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
