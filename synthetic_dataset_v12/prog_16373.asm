; DESCRIPTION: Renders a white box of size 113x72 starting at (292, 19).
; PLAN: r0=292(x), r1=19(y), r2=113(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 19
LDI r2, 113
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
