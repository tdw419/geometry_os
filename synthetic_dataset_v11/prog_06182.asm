; DESCRIPTION: Renders a red box of size 117x91 starting at (113, 56).
; PLAN: r0=113(x), r1=56(y), r2=117(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 56
LDI r2, 117
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
