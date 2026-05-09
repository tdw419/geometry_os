; DESCRIPTION: Renders a black box of size 16x26 starting at (79, 179).
; PLAN: r0=79(x), r1=179(y), r2=16(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 179
LDI r2, 16
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
