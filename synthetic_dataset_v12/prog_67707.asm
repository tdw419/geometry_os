; DESCRIPTION: Renders a red box of size 107x85 starting at (304, 67).
; PLAN: r0=304(x), r1=67(y), r2=107(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 67
LDI r2, 107
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
