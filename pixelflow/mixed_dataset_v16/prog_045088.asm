; DESCRIPTION: Renders a orange box of size 15x99 starting at (279, 140).
; PLAN: r0=279(x), r1=140(y), r2=15(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 140
LDI r2, 15
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
