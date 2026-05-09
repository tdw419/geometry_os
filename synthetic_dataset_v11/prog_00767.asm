; DESCRIPTION: Draws a cyan rectangle at (0, 193) with width 33 and height 50.
; PLAN: r0=0(x), r1=193(y), r2=33(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 193
LDI r2, 33
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
