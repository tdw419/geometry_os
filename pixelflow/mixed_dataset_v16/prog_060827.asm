; DESCRIPTION: Renders a cyan line between points (251, 213) and (439, 117).
; PLAN: r0=251(x1), r1=213(y1), r2=439(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 213
LDI r2, 439
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
