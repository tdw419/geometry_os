; DESCRIPTION: Renders a red box of size 99x44 starting at (204, 86).
; PLAN: r0=204(x), r1=86(y), r2=99(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 86
LDI r2, 99
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
