; DESCRIPTION: Composite: Places a magenta 87x27 rectangle at position (32, 135) then Places a red line segment connecting (230, 25) to (35, 184).
; PLAN: r0=32(x), r1=135(y), r2=87(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=25(y1), r7=35(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 135
LDI r2, 87
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 25
LDI r7, 35
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
