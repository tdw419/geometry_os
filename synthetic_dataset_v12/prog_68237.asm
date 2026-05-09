; DESCRIPTION: Renders a cyan line between points (328, 194) and (57, 246).
; PLAN: r0=328(x1), r1=194(y1), r2=57(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 194
LDI r2, 57
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
