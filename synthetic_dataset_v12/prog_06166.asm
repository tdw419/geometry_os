; DESCRIPTION: Draws a magenta rectangle at (406, 129) with width 48 and height 105.
; PLAN: r0=406(x), r1=129(y), r2=48(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 129
LDI r2, 48
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
