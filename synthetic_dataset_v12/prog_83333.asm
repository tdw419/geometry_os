; DESCRIPTION: Renders a white box of size 17x112 starting at (485, 117).
; PLAN: r0=485(x), r1=117(y), r2=17(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 117
LDI r2, 17
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
