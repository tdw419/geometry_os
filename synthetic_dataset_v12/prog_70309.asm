; DESCRIPTION: Renders a black box of size 100x45 starting at (87, 91).
; PLAN: r0=87(x), r1=91(y), r2=100(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 91
LDI r2, 100
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
