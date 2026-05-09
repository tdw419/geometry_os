; DESCRIPTION: Renders a red box of size 66x28 starting at (91, 124).
; PLAN: r0=91(x), r1=124(y), r2=66(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 124
LDI r2, 66
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
