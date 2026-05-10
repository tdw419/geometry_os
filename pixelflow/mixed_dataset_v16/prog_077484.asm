; DESCRIPTION: Creates a white rectangular region at (0, 16) spanning 50 by 85 pixels.
; PLAN: r0=0(x), r1=16(y), r2=50(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 16
LDI r2, 50
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
