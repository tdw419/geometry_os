; DESCRIPTION: Renders a red rectangular region spanning 111 by 22 at (238, 40).
; PLAN: r0=238(x), r1=40(y), r2=111(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 40
LDI r2, 111
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
