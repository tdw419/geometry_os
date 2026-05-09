; DESCRIPTION: Draws a cyan rectangle at (186, 57) with width 87 and height 68.
; PLAN: r0=186(x), r1=57(y), r2=87(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 57
LDI r2, 87
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
