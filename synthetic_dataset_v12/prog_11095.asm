; DESCRIPTION: Creates a red rectangular region at (178, 31) spanning 111 by 29 pixels.
; PLAN: r0=178(x), r1=31(y), r2=111(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 31
LDI r2, 111
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
