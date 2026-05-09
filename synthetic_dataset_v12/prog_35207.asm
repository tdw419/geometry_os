; DESCRIPTION: Renders a white box of size 90x111 starting at (179, 138).
; PLAN: r0=179(x), r1=138(y), r2=90(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 138
LDI r2, 90
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
