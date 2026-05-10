; DESCRIPTION: Renders a red box of size 11x104 starting at (237, 87).
; PLAN: r0=237(x), r1=87(y), r2=11(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 87
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
