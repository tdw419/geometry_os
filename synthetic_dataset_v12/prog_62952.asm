; DESCRIPTION: Renders a red box of size 85x90 starting at (157, 84).
; PLAN: r0=157(x), r1=84(y), r2=85(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 84
LDI r2, 85
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
