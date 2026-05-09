; DESCRIPTION: Renders a green box of size 15x20 starting at (427, 146).
; PLAN: r0=427(x), r1=146(y), r2=15(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 146
LDI r2, 15
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
