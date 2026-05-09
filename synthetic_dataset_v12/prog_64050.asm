; DESCRIPTION: Draws a cyan line from (164, 65) to (434, 18).
; PLAN: r0=164(x1), r1=65(y1), r2=434(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 65
LDI r2, 434
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
