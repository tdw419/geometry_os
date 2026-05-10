; DESCRIPTION: Renders a cyan line segment connecting (123, 176) to (272, 29).
; PLAN: r0=123(x1), r1=176(y1), r2=272(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 176
LDI r2, 272
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
