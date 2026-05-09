; DESCRIPTION: Composite: Places a red line segment connecting (8, 213) to (75, 0) then Places a blue 55x98 rectangle at position (360, 123).
; PLAN: r0=8(x1), r1=213(y1), r2=75(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=123(y), r7=55(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 213
LDI r2, 75
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 123
LDI r7, 55
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
