; DESCRIPTION: Creates a red rectangular region at (223, 14) spanning 30 by 120 pixels.
; PLAN: r0=223(x), r1=14(y), r2=30(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 14
LDI r2, 30
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
