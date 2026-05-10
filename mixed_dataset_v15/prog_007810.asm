; DESCRIPTION: Draws a yellow rectangle at (387, 108) with width 91 and height 80.
; PLAN: r0=387(x), r1=108(y), r2=91(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 108
LDI r2, 91
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
