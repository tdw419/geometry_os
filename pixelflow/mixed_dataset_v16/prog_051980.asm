; DESCRIPTION: Renders a green box of size 40x92 starting at (445, 118).
; PLAN: r0=445(x), r1=118(y), r2=40(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 118
LDI r2, 40
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
