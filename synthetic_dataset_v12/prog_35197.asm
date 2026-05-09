; DESCRIPTION: Renders a green box of size 67x86 starting at (361, 158).
; PLAN: r0=361(x), r1=158(y), r2=67(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 158
LDI r2, 67
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
