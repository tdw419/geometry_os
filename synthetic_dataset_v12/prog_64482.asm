; DESCRIPTION: Renders a white box of size 52x33 starting at (39, 190).
; PLAN: r0=39(x), r1=190(y), r2=52(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 190
LDI r2, 52
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
