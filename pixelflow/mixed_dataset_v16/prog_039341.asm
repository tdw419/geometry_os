; DESCRIPTION: Composite: Places a white 105x19 rectangle at position (229, 64) then Places a magenta line segment connecting (255, 214) to (116, 58).
; PLAN: r0=229(x), r1=64(y), r2=105(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=214(y1), r7=116(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 64
LDI r2, 105
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 214
LDI r7, 116
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
