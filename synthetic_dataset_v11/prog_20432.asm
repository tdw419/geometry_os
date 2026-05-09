; DESCRIPTION: Renders a yellow box of size 107x50 starting at (68, 102).
; PLAN: r0=68(x), r1=102(y), r2=107(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 102
LDI r2, 107
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
