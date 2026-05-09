; DESCRIPTION: Draws a cyan rectangle at (401, 156) with width 78 and height 86.
; PLAN: r0=401(x), r1=156(y), r2=78(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 156
LDI r2, 78
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
