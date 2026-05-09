; DESCRIPTION: Draws a cyan line from (20, 116) to (39, 37).
; PLAN: r0=20(x1), r1=116(y1), r2=39(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 116
LDI r2, 39
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
