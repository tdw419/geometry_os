; DESCRIPTION: Renders a red box of size 21x112 starting at (206, 99).
; PLAN: r0=206(x), r1=99(y), r2=21(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 99
LDI r2, 21
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
