; DESCRIPTION: Renders a cyan line between points (87, 117) and (154, 234).
; PLAN: r0=87(x1), r1=117(y1), r2=154(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 117
LDI r2, 154
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
