; DESCRIPTION: Draws a cyan line from (154, 237) to (197, 99).
; PLAN: r0=154(x1), r1=237(y1), r2=197(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 237
LDI r2, 197
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
