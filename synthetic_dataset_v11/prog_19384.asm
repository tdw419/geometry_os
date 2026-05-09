; DESCRIPTION: Renders a cyan line between points (166, 64) and (236, 64).
; PLAN: r0=166(x1), r1=64(y1), r2=236(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 64
LDI r2, 236
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
