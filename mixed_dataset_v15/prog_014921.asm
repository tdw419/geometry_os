; DESCRIPTION: Draws a cyan rectangle at (112, 141) with width 104 and height 57.
; PLAN: r0=112(x), r1=141(y), r2=104(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 141
LDI r2, 104
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
