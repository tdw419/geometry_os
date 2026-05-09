; DESCRIPTION: Renders a red box of size 34x90 starting at (139, 104).
; PLAN: r0=139(x), r1=104(y), r2=34(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 104
LDI r2, 34
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
