; DESCRIPTION: Renders a green rectangular region spanning 95 by 53 at (335, 70).
; PLAN: r0=335(x), r1=70(y), r2=95(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 70
LDI r2, 95
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
