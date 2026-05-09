; DESCRIPTION: Renders a white box of size 90x92 starting at (77, 109).
; PLAN: r0=77(x), r1=109(y), r2=90(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 109
LDI r2, 90
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
