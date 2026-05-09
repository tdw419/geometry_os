; DESCRIPTION: Draws a cyan line from (202, 190) to (21, 42).
; PLAN: r0=202(x1), r1=190(y1), r2=21(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 190
LDI r2, 21
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
