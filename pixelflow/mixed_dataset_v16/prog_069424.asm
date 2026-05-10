; DESCRIPTION: Renders a cyan line between points (163, 166) and (107, 30).
; PLAN: r0=163(x1), r1=166(y1), r2=107(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 166
LDI r2, 107
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
