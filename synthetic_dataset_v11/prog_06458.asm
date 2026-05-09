; DESCRIPTION: Composite: . Then Draws a cyan line from (75, 17) to (15, 194). Then Renders a white box of size 39x104 starting at (172, 40).
; PLAN: r0=75(x1), r1=17(y1), r2=15(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=172(x), r1=40(y), r2=39(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (75, 17) to (15, 194).
; PLAN: r0=75(x1), r1=17(y1), r2=15(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 17
LDI r2, 15
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white box of size 39x104 starting at (172, 40).
; PLAN: r0=172(x), r1=40(y), r2=39(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 40
LDI r2, 39
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
