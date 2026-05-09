; DESCRIPTION: Renders a cyan line between points (207, 170) and (191, 42).
; PLAN: r0=207(x1), r1=170(y1), r2=191(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 170
LDI r2, 191
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
