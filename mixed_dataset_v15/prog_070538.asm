; DESCRIPTION: Draws a cyan line from (205, 60) to (360, 226).
; PLAN: r0=205(x1), r1=60(y1), r2=360(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 60
LDI r2, 360
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
