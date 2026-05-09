; DESCRIPTION: Renders a cyan line between points (41, 228) and (7, 219).
; PLAN: r0=41(x1), r1=228(y1), r2=7(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 228
LDI r2, 7
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
