; DESCRIPTION: Creates a red rectangular region at (111, 10) spanning 40 by 70 pixels.
; PLAN: r0=111(x), r1=10(y), r2=40(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 10
LDI r2, 40
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
