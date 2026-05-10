; DESCRIPTION: Renders a red box of size 30x79 starting at (420, 109).
; PLAN: r0=420(x), r1=109(y), r2=30(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 109
LDI r2, 30
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
