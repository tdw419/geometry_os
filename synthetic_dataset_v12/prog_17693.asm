; DESCRIPTION: Renders a red box of size 108x54 starting at (245, 104).
; PLAN: r0=245(x), r1=104(y), r2=108(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 104
LDI r2, 108
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
