; DESCRIPTION: Draws a cyan rectangle at (130, 90) with width 37 and height 103.
; PLAN: r0=130(x), r1=90(y), r2=37(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 90
LDI r2, 37
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
