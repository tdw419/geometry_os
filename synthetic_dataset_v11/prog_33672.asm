; DESCRIPTION: Draws a cyan line from (159, 23) to (154, 195).
; PLAN: r0=159(x1), r1=23(y1), r2=154(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 23
LDI r2, 154
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
