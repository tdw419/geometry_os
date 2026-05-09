; DESCRIPTION: Renders a blue box of size 111x59 starting at (189, 117).
; PLAN: r0=189(x), r1=117(y), r2=111(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 117
LDI r2, 111
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
