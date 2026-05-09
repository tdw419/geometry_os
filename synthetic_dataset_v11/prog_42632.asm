; DESCRIPTION: Creates a white rectangular region at (40, 230) spanning 120 by 20 pixels.
; PLAN: r0=40(x), r1=230(y), r2=120(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 230
LDI r2, 120
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
