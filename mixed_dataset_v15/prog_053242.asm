; DESCRIPTION: Draws a cyan rectangle at (237, 161) with width 39 and height 41.
; PLAN: r0=237(x), r1=161(y), r2=39(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 161
LDI r2, 39
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
