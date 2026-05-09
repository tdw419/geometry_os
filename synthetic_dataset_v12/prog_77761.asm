; DESCRIPTION: Renders a red box of size 20x67 starting at (82, 11).
; PLAN: r0=82(x), r1=11(y), r2=20(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 11
LDI r2, 20
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
