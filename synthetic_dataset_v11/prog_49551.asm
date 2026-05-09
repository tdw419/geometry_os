; DESCRIPTION: Renders a red box of size 65x10 starting at (124, 213).
; PLAN: r0=124(x), r1=213(y), r2=65(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 213
LDI r2, 65
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
