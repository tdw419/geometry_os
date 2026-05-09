; DESCRIPTION: Renders a cyan line between points (247, 207) and (166, 90).
; PLAN: r0=247(x1), r1=207(y1), r2=166(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 207
LDI r2, 166
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
