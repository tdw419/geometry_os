; DESCRIPTION: Renders a red box of size 107x74 starting at (156, 74).
; PLAN: r0=156(x), r1=74(y), r2=107(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 74
LDI r2, 107
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
