; DESCRIPTION: Draws a yellow rectangle at (392, 76) with width 41 and height 120.
; PLAN: r0=392(x), r1=76(y), r2=41(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 76
LDI r2, 41
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
