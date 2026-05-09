; DESCRIPTION: Renders a red box of size 99x94 starting at (298, 108).
; PLAN: r0=298(x), r1=108(y), r2=99(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 108
LDI r2, 99
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
