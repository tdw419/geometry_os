; DESCRIPTION: Renders a cyan line between points (272, 143) and (437, 63).
; PLAN: r0=272(x1), r1=143(y1), r2=437(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 143
LDI r2, 437
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
