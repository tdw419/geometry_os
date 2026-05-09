; DESCRIPTION: Creates a white rectangular region at (450, 22) spanning 54 by 93 pixels.
; PLAN: r0=450(x), r1=22(y), r2=54(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 22
LDI r2, 54
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
