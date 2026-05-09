; DESCRIPTION: Creates a white rectangular region at (91, 133) spanning 107 by 33 pixels.
; PLAN: r0=91(x), r1=133(y), r2=107(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 133
LDI r2, 107
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
