; DESCRIPTION: Draws a cyan line from (377, 168) to (164, 127).
; PLAN: r0=377(x1), r1=168(y1), r2=164(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 168
LDI r2, 164
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
