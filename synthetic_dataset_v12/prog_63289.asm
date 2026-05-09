; DESCRIPTION: Creates a white rectangular region at (69, 84) spanning 107 by 50 pixels.
; PLAN: r0=69(x), r1=84(y), r2=107(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 84
LDI r2, 107
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
