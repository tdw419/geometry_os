; DESCRIPTION: Draws a cyan rectangle at (288, 16) with width 68 and height 46.
; PLAN: r0=288(x), r1=16(y), r2=68(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 16
LDI r2, 68
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
