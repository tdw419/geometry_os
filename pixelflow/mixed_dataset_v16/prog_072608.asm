; DESCRIPTION: Renders a cyan line between points (311, 5) and (64, 209).
; PLAN: r0=311(x1), r1=5(y1), r2=64(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 5
LDI r2, 64
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
