; DESCRIPTION: Draws a black rectangle at (295, 41) with width 120 and height 48.
; PLAN: r0=295(x), r1=41(y), r2=120(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 41
LDI r2, 120
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
