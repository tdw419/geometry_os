; DESCRIPTION: Draws a white rectangle at (178, 129) with width 41 and height 83.
; PLAN: r0=178(x), r1=129(y), r2=41(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 129
LDI r2, 41
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
