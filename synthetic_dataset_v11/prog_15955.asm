; DESCRIPTION: Renders a green box of size 100x22 starting at (59, 207).
; PLAN: r0=59(x), r1=207(y), r2=100(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 207
LDI r2, 100
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
