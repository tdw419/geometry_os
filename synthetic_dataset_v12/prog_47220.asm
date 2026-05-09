; DESCRIPTION: Composite: Draws a orange line from (509, 133) to (346, 110) then Places a green 35x76 rectangle at position (267, 135).
; PLAN: r0=509(x1), r1=133(y1), r2=346(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=135(y), r7=35(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 133
LDI r2, 346
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 135
LDI r7, 35
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
