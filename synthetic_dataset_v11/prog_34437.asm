; DESCRIPTION: Creates a black rectangular region at (70, 165) spanning 81 by 47 pixels.
; PLAN: r0=70(x), r1=165(y), r2=81(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 165
LDI r2, 81
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
