; DESCRIPTION: Renders a red box of size 46x26 starting at (8, 225).
; PLAN: r0=8(x), r1=225(y), r2=46(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 225
LDI r2, 46
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
