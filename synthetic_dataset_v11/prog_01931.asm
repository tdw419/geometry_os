; DESCRIPTION: Creates a red rectangular region at (52, 68) spanning 50 by 49 pixels.
; PLAN: r0=52(x), r1=68(y), r2=50(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 68
LDI r2, 50
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
