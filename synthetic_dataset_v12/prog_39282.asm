; DESCRIPTION: Renders a green box of size 96x92 starting at (98, 162).
; PLAN: r0=98(x), r1=162(y), r2=96(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 162
LDI r2, 96
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
