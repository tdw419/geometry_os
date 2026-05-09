; DESCRIPTION: Creates a red rectangular region at (1, 25) spanning 50 by 54 pixels.
; PLAN: r0=1(x), r1=25(y), r2=50(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 25
LDI r2, 50
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
