; DESCRIPTION: Composite: Renders a cyan line between points (164, 35) and (134, 146) then Draws a white rectangle at (57, 79) with width 72 and height 35.
; PLAN: r0=164(x1), r1=35(y1), r2=134(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=79(y), r7=72(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 35
LDI r2, 134
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 79
LDI r7, 72
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
