; DESCRIPTION: Renders a red box of size 111x67 starting at (150, 95).
; PLAN: r0=150(x), r1=95(y), r2=111(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 95
LDI r2, 111
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
