; DESCRIPTION: Composite: Renders a magenta line between points (495, 72) and (46, 28) then Sets a single cyan pixel at (453, 190).
; PLAN: r0=495(x1), r1=72(y1), r2=46(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 495
LDI r1, 72
LDI r2, 46
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
