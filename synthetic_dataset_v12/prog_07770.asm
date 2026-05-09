; DESCRIPTION: Draws a cyan rectangle at (392, 65) with width 49 and height 44.
; PLAN: r0=392(x), r1=65(y), r2=49(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 65
LDI r2, 49
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
