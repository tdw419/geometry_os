; DESCRIPTION: Renders a blue box of size 39x40 starting at (171, 13).
; PLAN: r0=171(x), r1=13(y), r2=39(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 13
LDI r2, 39
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
