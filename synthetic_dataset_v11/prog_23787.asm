; DESCRIPTION: Renders a white box of size 117x33 starting at (116, 163).
; PLAN: r0=116(x), r1=163(y), r2=117(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 163
LDI r2, 117
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
