; DESCRIPTION: Composite: Places a green dot at position (147, 200) then Renders a cyan box of size 15x14 starting at (350, 91).
; PLAN: r0=147(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=91(y), r7=15(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 350
LDI r6, 91
LDI r7, 15
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
