; DESCRIPTION: Composite: Places a magenta dot at position (7, 95) then Places a white line segment connecting (287, 164) to (220, 154).
; PLAN: r0=7(x), r1=95(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=287(x1), r6=164(y1), r7=220(x2), r8=154(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 95
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 164
LDI r7, 220
LDI r8, 154
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
