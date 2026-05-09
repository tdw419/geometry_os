; DESCRIPTION: Creates a white rectangular region at (69, 202) spanning 26 by 54 pixels.
; PLAN: r0=69(x), r1=202(y), r2=26(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 202
LDI r2, 26
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
