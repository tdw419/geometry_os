; DESCRIPTION: Renders a cyan line between points (57, 32) and (315, 60).
; PLAN: r0=57(x1), r1=32(y1), r2=315(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 32
LDI r2, 315
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
