; DESCRIPTION: Creates a white rectangular region at (210, 100) spanning 18 by 50 pixels.
; PLAN: r0=210(x), r1=100(y), r2=18(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 100
LDI r2, 18
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
