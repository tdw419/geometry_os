; DESCRIPTION: Draws a cyan rectangle at (39, 28) with width 10 and height 34.
; PLAN: r0=39(x), r1=28(y), r2=10(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 28
LDI r2, 10
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
