; DESCRIPTION: Renders a cyan line between points (161, 117) and (107, 126).
; PLAN: r0=161(x1), r1=117(y1), r2=107(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 117
LDI r2, 107
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
