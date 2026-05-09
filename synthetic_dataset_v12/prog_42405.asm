; DESCRIPTION: Creates a yellow rectangular region at (95, 189) spanning 48 by 53 pixels.
; PLAN: r0=95(x), r1=189(y), r2=48(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 189
LDI r2, 48
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
