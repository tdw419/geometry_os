; DESCRIPTION: Renders a cyan line between points (271, 179) and (12, 173).
; PLAN: r0=271(x1), r1=179(y1), r2=12(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 179
LDI r2, 12
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
