; DESCRIPTION: Places a red 91x69 rectangle at position (374, 26).
; PLAN: r0=374(x), r1=26(y), r2=91(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 26
LDI r2, 91
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
