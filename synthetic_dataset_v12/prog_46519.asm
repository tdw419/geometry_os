; DESCRIPTION: Creates a white rectangular region at (337, 112) spanning 59 by 25 pixels.
; PLAN: r0=337(x), r1=112(y), r2=59(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 112
LDI r2, 59
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
