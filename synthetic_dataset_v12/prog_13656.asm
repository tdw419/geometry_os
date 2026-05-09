; DESCRIPTION: Creates a red rectangular region at (47, 214) spanning 60 by 37 pixels.
; PLAN: r0=47(x), r1=214(y), r2=60(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 214
LDI r2, 60
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
