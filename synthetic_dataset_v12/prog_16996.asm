; DESCRIPTION: Renders a yellow box of size 76x47 starting at (172, 28).
; PLAN: r0=172(x), r1=28(y), r2=76(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 28
LDI r2, 76
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
