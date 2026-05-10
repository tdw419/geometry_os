; DESCRIPTION: Places a green 67x83 rectangle at position (303, 3).
; PLAN: r0=303(x), r1=3(y), r2=67(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 3
LDI r2, 67
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
