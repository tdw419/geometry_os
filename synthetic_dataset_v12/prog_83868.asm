; DESCRIPTION: Draws a cyan line from (202, 182) to (220, 177).
; PLAN: r0=202(x1), r1=182(y1), r2=220(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 182
LDI r2, 220
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
