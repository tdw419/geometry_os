; DESCRIPTION: Composite: Places a red dot at position (107, 242) then Places a magenta line segment connecting (353, 180) to (21, 242).
; PLAN: r0=107(x), r1=242(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=353(x1), r6=180(y1), r7=21(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 242
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 353
LDI r6, 180
LDI r7, 21
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
