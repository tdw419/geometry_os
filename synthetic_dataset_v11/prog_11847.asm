; DESCRIPTION: Renders a white box of size 52x99 starting at (153, 131).
; PLAN: r0=153(x), r1=131(y), r2=52(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 131
LDI r2, 52
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
