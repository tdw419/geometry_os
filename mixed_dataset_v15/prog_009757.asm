; DESCRIPTION: Draws a cyan rectangle at (297, 45) with width 24 and height 85.
; PLAN: r0=297(x), r1=45(y), r2=24(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 45
LDI r2, 24
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
