; DESCRIPTION: Draws a cyan line from (69, 70) to (75, 139).
; PLAN: r0=69(x1), r1=70(y1), r2=75(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 70
LDI r2, 75
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
