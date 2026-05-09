; DESCRIPTION: Renders a yellow box of size 25x58 starting at (281, 34).
; PLAN: r0=281(x), r1=34(y), r2=25(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 34
LDI r2, 25
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
