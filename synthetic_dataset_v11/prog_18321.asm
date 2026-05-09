; DESCRIPTION: Creates a white rectangular region at (108, 177) spanning 113 by 22 pixels.
; PLAN: r0=108(x), r1=177(y), r2=113(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 177
LDI r2, 113
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
