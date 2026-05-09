; DESCRIPTION: Renders a cyan line between points (212, 242) and (382, 204).
; PLAN: r0=212(x1), r1=242(y1), r2=382(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 242
LDI r2, 382
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
