; DESCRIPTION: Renders a white box of size 92x52 starting at (3, 190).
; PLAN: r0=3(x), r1=190(y), r2=92(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 190
LDI r2, 92
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
