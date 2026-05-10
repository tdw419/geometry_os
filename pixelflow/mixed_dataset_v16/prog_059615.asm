; DESCRIPTION: Composite: Places a cyan line segment connecting (4, 162) to (70, 67) then Places a magenta dot at position (259, 54).
; PLAN: r0=4(x1), r1=162(y1), r2=70(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=54(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 162
LDI r2, 70
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 54
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
