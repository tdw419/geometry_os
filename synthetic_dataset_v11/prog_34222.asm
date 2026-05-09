; DESCRIPTION: Draws a red rectangle at (39, 129) with width 54 and height 117.
; PLAN: r0=39(x), r1=129(y), r2=54(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 129
LDI r2, 54
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
