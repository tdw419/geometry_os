; DESCRIPTION: Creates a red rectangular region at (170, 120) spanning 63 by 100 pixels.
; PLAN: r0=170(x), r1=120(y), r2=63(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 120
LDI r2, 63
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
