; DESCRIPTION: Renders a green box of size 86x102 starting at (256, 67).
; PLAN: r0=256(x), r1=67(y), r2=86(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 67
LDI r2, 86
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
