; DESCRIPTION: Composite: Places a green line segment connecting (345, 103) to (23, 5) then Places a red 47x53 rectangle at position (135, 176).
; PLAN: r0=345(x1), r1=103(y1), r2=23(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=176(y), r7=47(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 103
LDI r2, 23
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 176
LDI r7, 47
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
