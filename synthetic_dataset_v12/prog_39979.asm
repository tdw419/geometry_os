; DESCRIPTION: Draws a orange rectangle at (410, 129) with width 46 and height 54.
; PLAN: r0=410(x), r1=129(y), r2=46(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 129
LDI r2, 46
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
