; DESCRIPTION: Draws a cyan rectangle at (27, 161) with width 31 and height 18.
; PLAN: r0=27(x), r1=161(y), r2=31(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 161
LDI r2, 31
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
