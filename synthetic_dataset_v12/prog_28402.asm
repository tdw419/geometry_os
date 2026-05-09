; DESCRIPTION: Renders a red box of size 112x111 starting at (238, 59).
; PLAN: r0=238(x), r1=59(y), r2=112(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 59
LDI r2, 112
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
