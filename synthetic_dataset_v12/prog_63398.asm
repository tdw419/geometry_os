; DESCRIPTION: Renders a black box of size 47x13 starting at (152, 15).
; PLAN: r0=152(x), r1=15(y), r2=47(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 15
LDI r2, 47
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
