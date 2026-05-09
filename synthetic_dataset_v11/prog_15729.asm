; DESCRIPTION: Places a cyan line segment connecting (228, 190) to (45, 166).
; PLAN: r0=228(x1), r1=190(y1), r2=45(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 190
LDI r2, 45
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
