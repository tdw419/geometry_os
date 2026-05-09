; DESCRIPTION: Draws a cyan line from (467, 54) to (383, 190).
; PLAN: r0=467(x1), r1=54(y1), r2=383(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 54
LDI r2, 383
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
