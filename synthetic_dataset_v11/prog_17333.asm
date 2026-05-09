; DESCRIPTION: Renders a red box of size 75x73 starting at (141, 131).
; PLAN: r0=141(x), r1=131(y), r2=75(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 131
LDI r2, 75
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
