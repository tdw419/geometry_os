; DESCRIPTION: Renders a white box of size 27x47 starting at (463, 190).
; PLAN: r0=463(x), r1=190(y), r2=27(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 190
LDI r2, 27
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
