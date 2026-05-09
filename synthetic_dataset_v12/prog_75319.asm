; DESCRIPTION: Renders a white box of size 58x113 starting at (322, 140).
; PLAN: r0=322(x), r1=140(y), r2=58(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 140
LDI r2, 58
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
