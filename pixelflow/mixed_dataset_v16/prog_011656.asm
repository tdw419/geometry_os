; DESCRIPTION: Draws a purple rectangle at (406, 129) with width 106 and height 85.
; PLAN: r0=406(x), r1=129(y), r2=106(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 129
LDI r2, 106
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
