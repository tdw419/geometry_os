; DESCRIPTION: Draws a cyan rectangle at (401, 91) with width 46 and height 66.
; PLAN: r0=401(x), r1=91(y), r2=46(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 91
LDI r2, 46
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
