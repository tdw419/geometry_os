; DESCRIPTION: Creates a red rectangular region at (209, 54) spanning 12 by 117 pixels.
; PLAN: r0=209(x), r1=54(y), r2=12(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 54
LDI r2, 12
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
