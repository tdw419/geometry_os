; DESCRIPTION: Draws a cyan rectangle at (393, 221) with width 98 and height 18.
; PLAN: r0=393(x), r1=221(y), r2=98(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 221
LDI r2, 98
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
