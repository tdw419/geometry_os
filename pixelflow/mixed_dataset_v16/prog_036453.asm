; DESCRIPTION: Places a cyan line segment connecting (65, 168) to (60, 237).
; PLAN: r0=65(x1), r1=168(y1), r2=60(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 168
LDI r2, 60
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
