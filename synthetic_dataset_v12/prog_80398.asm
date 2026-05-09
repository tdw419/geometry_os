; DESCRIPTION: Renders a cyan line between points (95, 242) and (257, 52).
; PLAN: r0=95(x1), r1=242(y1), r2=257(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 242
LDI r2, 257
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
