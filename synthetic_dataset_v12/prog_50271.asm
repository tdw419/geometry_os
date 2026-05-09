; DESCRIPTION: Composite: Places a blue 76x120 rectangle at position (121, 6) then Places a magenta line segment connecting (387, 67) to (267, 147).
; PLAN: r0=121(x), r1=6(y), r2=76(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=67(y1), r7=267(x2), r8=147(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 6
LDI r2, 76
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 67
LDI r7, 267
LDI r8, 147
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
