; DESCRIPTION: Places a green 71x108 rectangle at position (352, 130).
; PLAN: r0=352(x), r1=130(y), r2=71(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 130
LDI r2, 71
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
