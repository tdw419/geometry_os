; DESCRIPTION: Creates a yellow rectangular region at (167, 50) spanning 53 by 120 pixels.
; PLAN: r0=167(x), r1=50(y), r2=53(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 50
LDI r2, 53
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
