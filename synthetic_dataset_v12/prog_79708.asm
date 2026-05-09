; DESCRIPTION: Renders a red box of size 98x68 starting at (107, 135).
; PLAN: r0=107(x), r1=135(y), r2=98(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 135
LDI r2, 98
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
