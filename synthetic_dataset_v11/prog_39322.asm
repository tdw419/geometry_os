; DESCRIPTION: Renders a red box of size 79x96 starting at (117, 160).
; PLAN: r0=117(x), r1=160(y), r2=79(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 160
LDI r2, 79
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
