; DESCRIPTION: Creates a red rectangular region at (219, 208) spanning 60 by 46 pixels.
; PLAN: r0=219(x), r1=208(y), r2=60(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 208
LDI r2, 60
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
