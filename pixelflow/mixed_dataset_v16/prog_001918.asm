; DESCRIPTION: Renders a cyan line between points (62, 16) and (365, 202).
; PLAN: r0=62(x1), r1=16(y1), r2=365(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 16
LDI r2, 365
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
