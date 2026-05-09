; DESCRIPTION: Renders a white box of size 78x36 starting at (79, 92).
; PLAN: r0=79(x), r1=92(y), r2=78(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 92
LDI r2, 78
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
