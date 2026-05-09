; DESCRIPTION: Places a yellow 62x68 rectangle at position (364, 118).
; PLAN: r0=364(x), r1=118(y), r2=62(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 118
LDI r2, 62
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
