; DESCRIPTION: Composite: Renders a yellow box of size 92x60 starting at (150, 167) then Renders a cyan line between points (222, 241) and (222, 64).
; PLAN: r0=150(x), r1=167(y), r2=92(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=241(y1), r7=222(x2), r8=64(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 167
LDI r2, 92
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 241
LDI r7, 222
LDI r8, 64
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
