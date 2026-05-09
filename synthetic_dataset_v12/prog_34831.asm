; DESCRIPTION: Renders a cyan line between points (164, 70) and (392, 14).
; PLAN: r0=164(x1), r1=70(y1), r2=392(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 70
LDI r2, 392
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
