; DESCRIPTION: Renders a cyan line between points (107, 27) and (429, 54).
; PLAN: r0=107(x1), r1=27(y1), r2=429(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 27
LDI r2, 429
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
