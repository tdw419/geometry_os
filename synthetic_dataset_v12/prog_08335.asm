; DESCRIPTION: Draws a cyan rectangle at (466, 190) with width 16 and height 41.
; PLAN: r0=466(x), r1=190(y), r2=16(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 190
LDI r2, 16
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
