; DESCRIPTION: Draws a cyan rectangle at (276, 176) with width 16 and height 60.
; PLAN: r0=276(x), r1=176(y), r2=16(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 176
LDI r2, 16
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
