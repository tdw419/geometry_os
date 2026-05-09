; DESCRIPTION: Renders a red box of size 39x111 starting at (33, 54).
; PLAN: r0=33(x), r1=54(y), r2=39(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 54
LDI r2, 39
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
