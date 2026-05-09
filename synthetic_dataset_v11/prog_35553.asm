; DESCRIPTION: Creates a red rectangular region at (50, 61) spanning 37 by 117 pixels.
; PLAN: r0=50(x), r1=61(y), r2=37(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 61
LDI r2, 37
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
