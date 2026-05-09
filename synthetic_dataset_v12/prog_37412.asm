; DESCRIPTION: Draws a cyan line from (441, 246) to (202, 154).
; PLAN: r0=441(x1), r1=246(y1), r2=202(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 246
LDI r2, 202
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
