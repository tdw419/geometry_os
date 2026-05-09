; DESCRIPTION: Renders a cyan line between points (200, 173) and (26, 207).
; PLAN: r0=200(x1), r1=173(y1), r2=26(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 173
LDI r2, 26
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
