; DESCRIPTION: Draws a cyan line from (363, 71) to (400, 126).
; PLAN: r0=363(x1), r1=71(y1), r2=400(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 71
LDI r2, 400
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
