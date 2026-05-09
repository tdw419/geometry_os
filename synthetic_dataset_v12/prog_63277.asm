; DESCRIPTION: Draws a yellow rectangle at (444, 129) with width 35 and height 34.
; PLAN: r0=444(x), r1=129(y), r2=35(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 129
LDI r2, 35
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
