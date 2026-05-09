; DESCRIPTION: Renders a cyan line between points (168, 212) and (493, 36).
; PLAN: r0=168(x1), r1=212(y1), r2=493(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 212
LDI r2, 493
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
