; DESCRIPTION: Renders a cyan line between points (376, 242) and (100, 247).
; PLAN: r0=376(x1), r1=242(y1), r2=100(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 242
LDI r2, 100
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
