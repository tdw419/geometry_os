; DESCRIPTION: Renders a cyan line between points (86, 117) and (231, 171).
; PLAN: r0=86(x1), r1=117(y1), r2=231(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 117
LDI r2, 231
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
