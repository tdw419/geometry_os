; DESCRIPTION: Renders a cyan line between points (16, 240) and (120, 2).
; PLAN: r0=16(x1), r1=240(y1), r2=120(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 240
LDI r2, 120
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
