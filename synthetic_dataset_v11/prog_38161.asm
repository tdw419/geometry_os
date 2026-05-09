; DESCRIPTION: Draws a cyan line from (176, 182) to (42, 57).
; PLAN: r0=176(x1), r1=182(y1), r2=42(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 182
LDI r2, 42
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
