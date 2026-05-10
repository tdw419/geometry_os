; DESCRIPTION: Draws a cyan rectangle at (275, 193) with width 41 and height 93.
; PLAN: r0=275(x), r1=193(y), r2=41(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 193
LDI r2, 41
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
