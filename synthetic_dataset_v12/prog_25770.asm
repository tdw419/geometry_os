; DESCRIPTION: Draws a cyan line from (308, 64) to (443, 141).
; PLAN: r0=308(x1), r1=64(y1), r2=443(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 64
LDI r2, 443
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
