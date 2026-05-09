; DESCRIPTION: Creates a red rectangular region at (435, 29) spanning 24 by 25 pixels.
; PLAN: r0=435(x), r1=29(y), r2=24(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 29
LDI r2, 24
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
