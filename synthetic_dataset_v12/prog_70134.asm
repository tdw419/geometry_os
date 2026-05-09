; DESCRIPTION: Draws a cyan rectangle at (450, 146) with width 46 and height 104.
; PLAN: r0=450(x), r1=146(y), r2=46(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 146
LDI r2, 46
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
