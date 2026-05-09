; DESCRIPTION: Draws a cyan rectangle at (34, 124) with width 25 and height 100.
; PLAN: r0=34(x), r1=124(y), r2=25(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 124
LDI r2, 25
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
