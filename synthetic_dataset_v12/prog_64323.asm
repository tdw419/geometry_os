; DESCRIPTION: Renders a blue box of size 104x27 starting at (192, 187).
; PLAN: r0=192(x), r1=187(y), r2=104(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 187
LDI r2, 104
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
