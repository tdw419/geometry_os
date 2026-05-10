; DESCRIPTION: Renders a blue box of size 65x113 starting at (445, 118).
; PLAN: r0=445(x), r1=118(y), r2=65(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 118
LDI r2, 65
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
