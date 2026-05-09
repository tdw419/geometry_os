; DESCRIPTION: Renders a blue box of size 58x99 starting at (445, 3).
; PLAN: r0=445(x), r1=3(y), r2=58(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 3
LDI r2, 58
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
