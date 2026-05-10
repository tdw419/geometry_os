; DESCRIPTION: Composite: Places a purple 109x103 rectangle at position (188, 87) then Places a cyan line segment connecting (377, 82) to (410, 106).
; PLAN: r0=188(x), r1=87(y), r2=109(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x1), r6=82(y1), r7=410(x2), r8=106(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 87
LDI r2, 109
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 82
LDI r7, 410
LDI r8, 106
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
