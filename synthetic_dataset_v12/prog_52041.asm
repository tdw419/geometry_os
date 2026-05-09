; DESCRIPTION: Renders a black box of size 56x90 starting at (176, 104).
; PLAN: r0=176(x), r1=104(y), r2=56(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 104
LDI r2, 56
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
