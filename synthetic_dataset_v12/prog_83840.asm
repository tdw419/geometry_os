; DESCRIPTION: Renders a red box of size 111x74 starting at (341, 98).
; PLAN: r0=341(x), r1=98(y), r2=111(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 98
LDI r2, 111
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
