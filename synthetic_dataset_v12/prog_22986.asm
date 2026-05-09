; DESCRIPTION: Draws a cyan line from (260, 180) to (215, 115).
; PLAN: r0=260(x1), r1=180(y1), r2=215(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 180
LDI r2, 215
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
