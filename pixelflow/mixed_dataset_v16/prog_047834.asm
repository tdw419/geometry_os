; DESCRIPTION: Composite: Places a red dot at position (505, 88) then Places a magenta line segment connecting (62, 108) to (134, 242).
; PLAN: r0=505(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=108(y1), r7=134(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 62
LDI r6, 108
LDI r7, 134
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
