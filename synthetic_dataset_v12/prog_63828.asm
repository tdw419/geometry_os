; DESCRIPTION: Renders a green box of size 67x69 starting at (372, 169).
; PLAN: r0=372(x), r1=169(y), r2=67(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 169
LDI r2, 67
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
