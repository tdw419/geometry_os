; DESCRIPTION: Renders a white box of size 34x117 starting at (322, 0).
; PLAN: r0=322(x), r1=0(y), r2=34(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 0
LDI r2, 34
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
