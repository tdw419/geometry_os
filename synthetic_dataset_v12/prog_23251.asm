; DESCRIPTION: Renders a yellow box of size 56x87 starting at (172, 74).
; PLAN: r0=172(x), r1=74(y), r2=56(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 74
LDI r2, 56
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
