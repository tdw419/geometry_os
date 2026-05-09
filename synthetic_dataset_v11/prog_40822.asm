; DESCRIPTION: Creates a white rectangular region at (120, 112) spanning 40 by 24 pixels.
; PLAN: r0=120(x), r1=112(y), r2=40(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 112
LDI r2, 40
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
