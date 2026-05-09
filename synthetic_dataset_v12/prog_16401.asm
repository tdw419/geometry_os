; DESCRIPTION: Composite: Places a green 34x73 rectangle at position (244, 103) then Places a yellow line segment connecting (80, 196) to (127, 23).
; PLAN: r0=244(x), r1=103(y), r2=34(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=196(y1), r7=127(x2), r8=23(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 103
LDI r2, 34
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 196
LDI r7, 127
LDI r8, 23
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
