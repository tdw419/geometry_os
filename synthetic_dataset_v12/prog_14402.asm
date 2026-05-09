; DESCRIPTION: Renders a green box of size 47x35 starting at (268, 137).
; PLAN: r0=268(x), r1=137(y), r2=47(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 137
LDI r2, 47
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
