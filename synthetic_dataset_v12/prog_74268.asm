; DESCRIPTION: Renders a red box of size 98x24 starting at (116, 95).
; PLAN: r0=116(x), r1=95(y), r2=98(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 95
LDI r2, 98
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
