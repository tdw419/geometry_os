; DESCRIPTION: Draws a yellow rectangle at (446, 180) with width 44 and height 72.
; PLAN: r0=446(x), r1=180(y), r2=44(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 180
LDI r2, 44
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
