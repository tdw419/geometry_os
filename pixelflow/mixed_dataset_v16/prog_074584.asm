; DESCRIPTION: Renders a cyan line between points (371, 168) and (439, 238).
; PLAN: r0=371(x1), r1=168(y1), r2=439(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 168
LDI r2, 439
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
