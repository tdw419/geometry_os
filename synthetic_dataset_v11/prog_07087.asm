; DESCRIPTION: Renders a red box of size 24x24 starting at (44, 27).
; PLAN: r0=44(x), r1=27(y), r2=24(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 27
LDI r2, 24
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
