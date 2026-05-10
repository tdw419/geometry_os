; DESCRIPTION: Renders a green box of size 102x67 starting at (132, 168).
; PLAN: r0=132(x), r1=168(y), r2=102(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 168
LDI r2, 102
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
