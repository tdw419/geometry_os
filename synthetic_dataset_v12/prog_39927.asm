; DESCRIPTION: Places a green 41x11 rectangle at position (192, 67).
; PLAN: r0=192(x), r1=67(y), r2=41(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 67
LDI r2, 41
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
