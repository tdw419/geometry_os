; DESCRIPTION: Renders a red box of size 65x23 starting at (245, 14).
; PLAN: r0=245(x), r1=14(y), r2=65(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 14
LDI r2, 65
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
