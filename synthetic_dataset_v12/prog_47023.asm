; DESCRIPTION: Renders a red box of size 42x111 starting at (432, 105).
; PLAN: r0=432(x), r1=105(y), r2=42(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 105
LDI r2, 42
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
