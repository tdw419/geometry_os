; DESCRIPTION: Renders a cyan line between points (392, 175) and (39, 50).
; PLAN: r0=392(x1), r1=175(y1), r2=39(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 175
LDI r2, 39
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
