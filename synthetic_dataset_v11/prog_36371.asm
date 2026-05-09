; DESCRIPTION: Creates a yellow rectangular region at (0, 125) spanning 47 by 120 pixels.
; PLAN: r0=0(x), r1=125(y), r2=47(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 125
LDI r2, 47
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
