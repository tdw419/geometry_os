; DESCRIPTION: Composite: Places a orange dot at position (42, 72) then Renders a cyan line between points (56, 162) and (123, 110).
; PLAN: r0=42(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=162(y1), r7=123(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 56
LDI r6, 162
LDI r7, 123
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
