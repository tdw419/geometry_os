; DESCRIPTION: Draws a cyan rectangle at (214, 149) with width 40 and height 33.
; PLAN: r0=214(x), r1=149(y), r2=40(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 149
LDI r2, 40
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
