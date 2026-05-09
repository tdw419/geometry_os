; DESCRIPTION: Renders a red box of size 113x82 starting at (66, 155).
; PLAN: r0=66(x), r1=155(y), r2=113(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 155
LDI r2, 113
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
