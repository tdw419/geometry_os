; DESCRIPTION: Renders a red box of size 98x104 starting at (109, 34).
; PLAN: r0=109(x), r1=34(y), r2=98(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 34
LDI r2, 98
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
