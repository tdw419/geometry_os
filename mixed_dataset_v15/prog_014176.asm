; DESCRIPTION: Renders a red box of size 12x91 starting at (427, 113).
; PLAN: r0=427(x), r1=113(y), r2=12(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 113
LDI r2, 12
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
