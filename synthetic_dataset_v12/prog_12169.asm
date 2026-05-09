; DESCRIPTION: Draws a red rectangle at (3, 129) with width 75 and height 72.
; PLAN: r0=3(x), r1=129(y), r2=75(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 129
LDI r2, 75
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
