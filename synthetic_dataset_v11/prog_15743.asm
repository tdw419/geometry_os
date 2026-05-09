; DESCRIPTION: Draws a cyan rectangle at (109, 146) with width 109 and height 20.
; PLAN: r0=109(x), r1=146(y), r2=109(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 146
LDI r2, 109
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
