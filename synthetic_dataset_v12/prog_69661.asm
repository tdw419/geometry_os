; DESCRIPTION: Composite: Renders a cyan line between points (484, 150) and (431, 79) then Draws a white rectangle at (379, 213) with width 66 and height 12.
; PLAN: r0=484(x1), r1=150(y1), r2=431(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=213(y), r7=66(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 150
LDI r2, 431
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 213
LDI r7, 66
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
