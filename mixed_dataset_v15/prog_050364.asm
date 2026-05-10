; DESCRIPTION: Composite: Renders a cyan box of size 47x66 starting at (4, 127) then Places a magenta line segment connecting (315, 139) to (228, 225).
; PLAN: r0=4(x), r1=127(y), r2=47(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=139(y1), r7=228(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 127
LDI r2, 47
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 139
LDI r7, 228
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
