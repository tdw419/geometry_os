; DESCRIPTION: Renders a red box of size 98x119 starting at (335, 104).
; PLAN: r0=335(x), r1=104(y), r2=98(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 104
LDI r2, 98
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
