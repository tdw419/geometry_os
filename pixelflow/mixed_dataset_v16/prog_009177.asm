; DESCRIPTION: Composite: Renders a purple line between points (24, 210) and (37, 128) then Renders a cyan box of size 31x100 starting at (102, 7).
; PLAN: r0=24(x1), r1=210(y1), r2=37(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=7(y), r7=31(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 210
LDI r2, 37
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 7
LDI r7, 31
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
