; DESCRIPTION: Draws a cyan rectangle at (112, 131) with width 40 and height 92.
; PLAN: r0=112(x), r1=131(y), r2=40(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 131
LDI r2, 40
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
