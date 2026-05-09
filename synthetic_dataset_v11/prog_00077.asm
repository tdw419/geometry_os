; DESCRIPTION: Renders a red box of size 23x120 starting at (90, 129).
; PLAN: r0=90(x), r1=129(y), r2=23(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 129
LDI r2, 23
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
