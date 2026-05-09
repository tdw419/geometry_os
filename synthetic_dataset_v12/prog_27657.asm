; DESCRIPTION: Creates a yellow rectangular region at (98, 125) spanning 55 by 120 pixels.
; PLAN: r0=98(x), r1=125(y), r2=55(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 125
LDI r2, 55
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
