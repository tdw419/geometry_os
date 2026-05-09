; DESCRIPTION: Composite: Places a magenta line segment connecting (388, 50) to (105, 82) then Places a cyan circle of radius 16 at center (193, 36).
; PLAN: r0=388(x1), r1=50(y1), r2=105(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=36(y), r7=16(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 50
LDI r2, 105
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 36
LDI r7, 16
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
