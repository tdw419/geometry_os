; DESCRIPTION: Renders a blue box of size 46x90 starting at (248, 36).
; PLAN: r0=248(x), r1=36(y), r2=46(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 36
LDI r2, 46
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
