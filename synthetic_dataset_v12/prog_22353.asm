; DESCRIPTION: Creates a white rectangular region at (91, 8) spanning 93 by 69 pixels.
; PLAN: r0=91(x), r1=8(y), r2=93(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 8
LDI r2, 93
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
