; DESCRIPTION: Renders a cyan line between points (424, 39) and (429, 90).
; PLAN: r0=424(x1), r1=39(y1), r2=429(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 39
LDI r2, 429
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
