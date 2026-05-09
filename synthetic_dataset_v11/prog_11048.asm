; DESCRIPTION: Draws a cyan line from (87, 39) to (176, 142).
; PLAN: r0=87(x1), r1=39(y1), r2=176(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 39
LDI r2, 176
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
