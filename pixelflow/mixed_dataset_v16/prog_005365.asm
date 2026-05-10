; DESCRIPTION: Draws a cyan line from (305, 178) to (57, 127).
; PLAN: r0=305(x1), r1=178(y1), r2=57(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 178
LDI r2, 57
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
