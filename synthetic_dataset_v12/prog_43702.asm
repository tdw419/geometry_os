; DESCRIPTION: Renders a black box of size 42x104 starting at (342, 22).
; PLAN: r0=342(x), r1=22(y), r2=42(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 22
LDI r2, 42
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
