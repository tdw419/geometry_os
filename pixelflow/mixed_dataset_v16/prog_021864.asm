; DESCRIPTION: Renders a blue box of size 47x26 starting at (173, 23).
; PLAN: r0=173(x), r1=23(y), r2=47(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 23
LDI r2, 47
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
