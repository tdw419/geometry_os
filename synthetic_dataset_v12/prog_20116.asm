; DESCRIPTION: Renders a red box of size 83x90 starting at (178, 10).
; PLAN: r0=178(x), r1=10(y), r2=83(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 10
LDI r2, 83
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
