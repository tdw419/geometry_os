; DESCRIPTION: Composite: Renders a cyan line between points (264, 61) and (181, 119) then Renders a cyan box of size 76x77 starting at (120, 101).
; PLAN: r0=264(x1), r1=61(y1), r2=181(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=101(y), r7=76(width), r8=77(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 61
LDI r2, 181
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 101
LDI r7, 76
LDI r8, 77
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
