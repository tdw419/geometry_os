; DESCRIPTION: Renders a red box of size 113x117 starting at (126, 107).
; PLAN: r0=126(x), r1=107(y), r2=113(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 107
LDI r2, 113
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
