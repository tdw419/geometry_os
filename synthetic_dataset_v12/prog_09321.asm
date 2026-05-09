; DESCRIPTION: Renders a red box of size 30x111 starting at (238, 117).
; PLAN: r0=238(x), r1=117(y), r2=30(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 117
LDI r2, 30
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
