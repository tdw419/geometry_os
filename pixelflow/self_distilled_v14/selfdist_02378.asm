; DESCRIPTION: Draws a cyan line from (234, 125) to (255, 6).
; PLAN: r0=234(x1), r1=125(y1), r2=255(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 125
LDI r2, 255
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
