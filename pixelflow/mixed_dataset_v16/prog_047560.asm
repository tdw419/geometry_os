; DESCRIPTION: Draws a cyan line from (178, 16) to (360, 2).
; PLAN: r0=178(x1), r1=16(y1), r2=360(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 16
LDI r2, 360
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
