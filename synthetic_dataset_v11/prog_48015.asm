; DESCRIPTION: Renders a cyan line between points (210, 244) and (16, 35).
; PLAN: r0=210(x1), r1=244(y1), r2=16(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 244
LDI r2, 16
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
