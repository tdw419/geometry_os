; DESCRIPTION: Draws a cyan line from (116, 57) to (202, 177).
; PLAN: r0=116(x1), r1=57(y1), r2=202(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 57
LDI r2, 202
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
