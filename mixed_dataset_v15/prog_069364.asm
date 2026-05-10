; DESCRIPTION: Draws a cyan rectangle at (149, 50) with width 48 and height 90.
; PLAN: r0=149(x), r1=50(y), r2=48(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 50
LDI r2, 48
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
