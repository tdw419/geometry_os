; DESCRIPTION: Renders a yellow box of size 76x69 starting at (218, 176).
; PLAN: r0=218(x), r1=176(y), r2=76(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 176
LDI r2, 76
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
