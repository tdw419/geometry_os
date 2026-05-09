; DESCRIPTION: Renders a cyan line between points (230, 146) and (231, 30).
; PLAN: r0=230(x1), r1=146(y1), r2=231(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 146
LDI r2, 231
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
