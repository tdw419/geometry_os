; DESCRIPTION: Draws a cyan line from (127, 53) to (156, 226).
; PLAN: r0=127(x1), r1=53(y1), r2=156(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 53
LDI r2, 156
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
