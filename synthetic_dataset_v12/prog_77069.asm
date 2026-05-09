; DESCRIPTION: Composite: Draws a cyan line from (493, 132) to (205, 231) then Draws a white rectangle at (365, 122) with width 66 and height 28.
; PLAN: r0=493(x1), r1=132(y1), r2=205(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=122(y), r7=66(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 132
LDI r2, 205
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 122
LDI r7, 66
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
