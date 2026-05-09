; DESCRIPTION: Creates a white rectangular region at (464, 69) spanning 43 by 54 pixels.
; PLAN: r0=464(x), r1=69(y), r2=43(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 69
LDI r2, 43
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
