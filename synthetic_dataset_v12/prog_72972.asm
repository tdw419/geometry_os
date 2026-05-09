; DESCRIPTION: Renders a cyan line between points (286, 246) and (228, 17).
; PLAN: r0=286(x1), r1=246(y1), r2=228(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 246
LDI r2, 228
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
