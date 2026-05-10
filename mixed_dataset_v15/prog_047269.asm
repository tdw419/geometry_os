; DESCRIPTION: Draws a cyan line from (306, 127) to (135, 103).
; PLAN: r0=306(x1), r1=127(y1), r2=135(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 127
LDI r2, 135
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
