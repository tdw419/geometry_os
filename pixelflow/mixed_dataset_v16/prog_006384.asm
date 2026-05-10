; DESCRIPTION: Renders a cyan line between points (178, 207) and (231, 243).
; PLAN: r0=178(x1), r1=207(y1), r2=231(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 207
LDI r2, 231
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
