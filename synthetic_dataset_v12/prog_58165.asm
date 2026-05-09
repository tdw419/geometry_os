; DESCRIPTION: Renders a cyan line between points (255, 212) and (156, 242).
; PLAN: r0=255(x1), r1=212(y1), r2=156(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 212
LDI r2, 156
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
