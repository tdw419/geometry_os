; DESCRIPTION: Composite: Renders a orange line between points (360, 160) and (233, 144) then Places a magenta 72x76 rectangle at position (429, 9).
; PLAN: r0=360(x1), r1=160(y1), r2=233(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=9(y), r7=72(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 160
LDI r2, 233
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 9
LDI r7, 72
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
