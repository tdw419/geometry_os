; DESCRIPTION: Creates a white rectangular region at (4, 103) spanning 54 by 112 pixels.
; PLAN: r0=4(x), r1=103(y), r2=54(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 103
LDI r2, 54
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
