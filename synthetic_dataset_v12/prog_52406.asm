; DESCRIPTION: Creates a red rectangular region at (274, 140) spanning 48 by 36 pixels.
; PLAN: r0=274(x), r1=140(y), r2=48(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 140
LDI r2, 48
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
