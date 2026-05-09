; DESCRIPTION: Draws a cyan rectangle at (130, 173) with width 115 and height 18.
; PLAN: r0=130(x), r1=173(y), r2=115(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 173
LDI r2, 115
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
