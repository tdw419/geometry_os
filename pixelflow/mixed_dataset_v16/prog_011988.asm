; DESCRIPTION: Renders a yellow box of size 18x62 starting at (90, 61).
; PLAN: r0=90(x), r1=61(y), r2=18(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 61
LDI r2, 18
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
