; DESCRIPTION: Draws a yellow rectangle at (410, 90) with width 44 and height 92.
; PLAN: r0=410(x), r1=90(y), r2=44(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 90
LDI r2, 44
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
