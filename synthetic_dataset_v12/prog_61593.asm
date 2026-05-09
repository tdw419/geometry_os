; DESCRIPTION: Draws a cyan rectangle at (224, 17) with width 76 and height 41.
; PLAN: r0=224(x), r1=17(y), r2=76(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 17
LDI r2, 76
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
