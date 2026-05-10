; DESCRIPTION: Renders a red box of size 111x86 starting at (273, 123).
; PLAN: r0=273(x), r1=123(y), r2=111(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 123
LDI r2, 111
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
