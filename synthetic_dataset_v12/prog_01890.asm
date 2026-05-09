; DESCRIPTION: Draws a cyan rectangle at (125, 124) with width 44 and height 94.
; PLAN: r0=125(x), r1=124(y), r2=44(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 124
LDI r2, 44
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
