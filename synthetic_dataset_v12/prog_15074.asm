; DESCRIPTION: Renders a red box of size 66x20 starting at (58, 208).
; PLAN: r0=58(x), r1=208(y), r2=66(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 208
LDI r2, 66
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
