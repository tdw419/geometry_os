; DESCRIPTION: Creates a white rectangular region at (277, 115) spanning 81 by 33 pixels.
; PLAN: r0=277(x), r1=115(y), r2=81(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 115
LDI r2, 81
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
