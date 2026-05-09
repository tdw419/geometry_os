; DESCRIPTION: Draws a cyan line from (39, 86) to (180, 93).
; PLAN: r0=39(x1), r1=86(y1), r2=180(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 86
LDI r2, 180
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
