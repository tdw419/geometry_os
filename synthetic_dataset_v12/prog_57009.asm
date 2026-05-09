; DESCRIPTION: Renders a red box of size 61x38 starting at (345, 190).
; PLAN: r0=345(x), r1=190(y), r2=61(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 190
LDI r2, 61
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
