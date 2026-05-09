; DESCRIPTION: Renders a yellow box of size 74x104 starting at (42, 98).
; PLAN: r0=42(x), r1=98(y), r2=74(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 98
LDI r2, 74
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
