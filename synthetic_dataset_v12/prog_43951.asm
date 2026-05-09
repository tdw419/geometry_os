; DESCRIPTION: Draws a cyan rectangle at (214, 34) with width 28 and height 22.
; PLAN: r0=214(x), r1=34(y), r2=28(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 34
LDI r2, 28
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
