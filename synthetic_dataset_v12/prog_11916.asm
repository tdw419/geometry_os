; DESCRIPTION: Draws a yellow rectangle at (298, 93) with width 95 and height 33.
; PLAN: r0=298(x), r1=93(y), r2=95(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 93
LDI r2, 95
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
