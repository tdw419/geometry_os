; DESCRIPTION: Draws a cyan line from (304, 154) to (81, 102).
; PLAN: r0=304(x1), r1=154(y1), r2=81(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 154
LDI r2, 81
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
