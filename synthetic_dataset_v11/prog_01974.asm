; DESCRIPTION: Renders a red box of size 102x90 starting at (129, 68).
; PLAN: r0=129(x), r1=68(y), r2=102(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 68
LDI r2, 102
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
