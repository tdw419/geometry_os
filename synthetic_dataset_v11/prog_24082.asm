; DESCRIPTION: Creates a red rectangular region at (160, 121) spanning 85 by 50 pixels.
; PLAN: r0=160(x), r1=121(y), r2=85(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 121
LDI r2, 85
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
