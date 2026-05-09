; DESCRIPTION: Renders a red box of size 90x111 starting at (168, 105).
; PLAN: r0=168(x), r1=105(y), r2=90(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 105
LDI r2, 90
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
