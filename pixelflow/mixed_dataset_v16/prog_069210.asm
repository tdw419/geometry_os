; DESCRIPTION: Composite: Places a blue line segment connecting (8, 61) to (325, 215) then Places a magenta 11x20 rectangle at position (346, 219).
; PLAN: r0=8(x1), r1=61(y1), r2=325(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=219(y), r7=11(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 61
LDI r2, 325
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 219
LDI r7, 11
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
