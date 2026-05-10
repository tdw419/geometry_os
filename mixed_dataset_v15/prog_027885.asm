; DESCRIPTION: Renders a green box of size 67x62 starting at (67, 91).
; PLAN: r0=67(x), r1=91(y), r2=67(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 91
LDI r2, 67
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
