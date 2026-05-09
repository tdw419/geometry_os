; DESCRIPTION: Renders a white box of size 71x52 starting at (127, 190).
; PLAN: r0=127(x), r1=190(y), r2=71(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 190
LDI r2, 71
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
