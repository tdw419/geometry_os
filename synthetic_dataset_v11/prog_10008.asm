; DESCRIPTION: Renders a red box of size 55x104 starting at (65, 94).
; PLAN: r0=65(x), r1=94(y), r2=55(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 94
LDI r2, 55
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
