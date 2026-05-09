; DESCRIPTION: Renders a cyan line between points (80, 163) and (398, 21).
; PLAN: r0=80(x1), r1=163(y1), r2=398(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 163
LDI r2, 398
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
