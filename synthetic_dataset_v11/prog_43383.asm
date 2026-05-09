; DESCRIPTION: Places a yellow 67x62 rectangle at position (97, 96).
; PLAN: r0=97(x), r1=96(y), r2=67(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 96
LDI r2, 67
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
