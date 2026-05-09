; DESCRIPTION: Draws a purple rectangle at (162, 129) with width 95 and height 87.
; PLAN: r0=162(x), r1=129(y), r2=95(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 129
LDI r2, 95
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
