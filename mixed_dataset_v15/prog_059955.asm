; DESCRIPTION: Draws a black rectangle at (243, 129) with width 59 and height 24.
; PLAN: r0=243(x), r1=129(y), r2=59(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 129
LDI r2, 59
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
