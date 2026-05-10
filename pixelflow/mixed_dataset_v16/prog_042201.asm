; DESCRIPTION: Renders a cyan line between points (281, 154) and (35, 212).
; PLAN: r0=281(x1), r1=154(y1), r2=35(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 154
LDI r2, 35
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
