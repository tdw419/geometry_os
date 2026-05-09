; DESCRIPTION: Creates a red rectangular region at (124, 169) spanning 80 by 53 pixels.
; PLAN: r0=124(x), r1=169(y), r2=80(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 169
LDI r2, 80
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
