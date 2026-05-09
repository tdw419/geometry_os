; DESCRIPTION: Composite: Places a red dot at position (70, 36) then Places a cyan line segment connecting (58, 27) to (431, 164).
; PLAN: r0=70(x), r1=36(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=58(x1), r6=27(y1), r7=431(x2), r8=164(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 36
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 58
LDI r6, 27
LDI r7, 431
LDI r8, 164
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
