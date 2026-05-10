; DESCRIPTION: Composite: Places a yellow 10x32 rectangle at position (350, 177) then Places a blue line segment connecting (205, 29) to (361, 247).
; PLAN: r0=350(x), r1=177(y), r2=10(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x1), r6=29(y1), r7=361(x2), r8=247(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 177
LDI r2, 10
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 29
LDI r7, 361
LDI r8, 247
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
