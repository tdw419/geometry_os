; DESCRIPTION: Renders a cyan line between points (27, 149) and (360, 255).
; PLAN: r0=27(x1), r1=149(y1), r2=360(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 149
LDI r2, 360
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
