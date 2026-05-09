; DESCRIPTION: Renders a red box of size 73x111 starting at (36, 36).
; PLAN: r0=36(x), r1=36(y), r2=73(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 36
LDI r2, 73
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
