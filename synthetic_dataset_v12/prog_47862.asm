; DESCRIPTION: Composite: Renders a purple line between points (127, 157) and (125, 144) then Places a orange 116x79 rectangle at position (116, 30).
; PLAN: r0=127(x1), r1=157(y1), r2=125(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=30(y), r7=116(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 157
LDI r2, 125
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 30
LDI r7, 116
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
