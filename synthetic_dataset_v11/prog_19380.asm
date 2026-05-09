; DESCRIPTION: Creates a white rectangular region at (74, 117) spanning 120 by 52 pixels.
; PLAN: r0=74(x), r1=117(y), r2=120(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 117
LDI r2, 120
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
