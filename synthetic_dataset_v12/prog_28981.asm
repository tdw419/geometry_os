; DESCRIPTION: Renders a red box of size 98x85 starting at (90, 73).
; PLAN: r0=90(x), r1=73(y), r2=98(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 73
LDI r2, 98
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
