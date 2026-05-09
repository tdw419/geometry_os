; DESCRIPTION: Places a yellow 34x91 rectangle at position (339, 10).
; PLAN: r0=339(x), r1=10(y), r2=34(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 10
LDI r2, 34
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
