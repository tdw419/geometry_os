; DESCRIPTION: Renders a cyan line between points (166, 85) and (173, 190).
; PLAN: r0=166(x1), r1=85(y1), r2=173(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 85
LDI r2, 173
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
