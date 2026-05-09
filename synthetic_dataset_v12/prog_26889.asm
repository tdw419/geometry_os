; DESCRIPTION: Composite: Renders a green line between points (51, 215) and (130, 78) then Renders a cyan box of size 85x84 starting at (92, 86).
; PLAN: r0=51(x1), r1=215(y1), r2=130(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=86(y), r7=85(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 215
LDI r2, 130
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 86
LDI r7, 85
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
