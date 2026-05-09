; DESCRIPTION: Draws a purple rectangle at (410, 129) with width 75 and height 92.
; PLAN: r0=410(x), r1=129(y), r2=75(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 129
LDI r2, 75
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
