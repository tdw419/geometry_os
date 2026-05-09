; DESCRIPTION: Composite: Places a orange 55x42 rectangle at position (150, 104) then Places a magenta line segment connecting (36, 247) to (210, 65).
; PLAN: r0=150(x), r1=104(y), r2=55(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=247(y1), r7=210(x2), r8=65(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 104
LDI r2, 55
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 247
LDI r7, 210
LDI r8, 65
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
