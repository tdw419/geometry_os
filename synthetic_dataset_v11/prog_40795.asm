; DESCRIPTION: Draws a cyan rectangle at (68, 47) with width 50 and height 60.
; PLAN: r0=68(x), r1=47(y), r2=50(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 47
LDI r2, 50
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
