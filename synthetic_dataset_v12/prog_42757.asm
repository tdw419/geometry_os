; DESCRIPTION: Renders a cyan line between points (229, 149) and (281, 209).
; PLAN: r0=229(x1), r1=149(y1), r2=281(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 149
LDI r2, 281
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
