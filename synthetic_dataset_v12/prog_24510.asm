; DESCRIPTION: Renders a red box of size 117x111 starting at (91, 67).
; PLAN: r0=91(x), r1=67(y), r2=117(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 67
LDI r2, 117
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
