; DESCRIPTION: Renders a cyan line between points (180, 172) and (246, 164).
; PLAN: r0=180(x1), r1=172(y1), r2=246(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 172
LDI r2, 246
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
