; DESCRIPTION: Renders a white box of size 116x11 starting at (279, 94).
; PLAN: r0=279(x), r1=94(y), r2=116(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 94
LDI r2, 116
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
