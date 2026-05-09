; DESCRIPTION: Renders a cyan line between points (394, 96) and (150, 229).
; PLAN: r0=394(x1), r1=96(y1), r2=150(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 96
LDI r2, 150
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
