; DESCRIPTION: Draws a red rectangle at (129, 129) with width 90 and height 82.
; PLAN: r0=129(x), r1=129(y), r2=90(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 129
LDI r2, 90
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
