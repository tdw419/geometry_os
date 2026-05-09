; DESCRIPTION: Renders a red box of size 17x27 starting at (4, 210).
; PLAN: r0=4(x), r1=210(y), r2=17(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 210
LDI r2, 17
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
