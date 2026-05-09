; DESCRIPTION: Composite: Places a magenta line segment connecting (39, 216) to (450, 148) then Places a yellow 95x68 rectangle at position (309, 184).
; PLAN: r0=39(x1), r1=216(y1), r2=450(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=184(y), r7=95(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 216
LDI r2, 450
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 184
LDI r7, 95
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
