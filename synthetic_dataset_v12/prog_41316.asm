; DESCRIPTION: Renders a blue box of size 98x16 starting at (313, 144).
; PLAN: r0=313(x), r1=144(y), r2=98(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 144
LDI r2, 98
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
