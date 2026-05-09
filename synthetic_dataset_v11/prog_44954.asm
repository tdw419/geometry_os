; DESCRIPTION: Renders a red box of size 111x44 starting at (15, 75).
; PLAN: r0=15(x), r1=75(y), r2=111(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 75
LDI r2, 111
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
