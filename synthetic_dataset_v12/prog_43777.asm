; DESCRIPTION: Draws a cyan line from (452, 204) to (82, 63).
; PLAN: r0=452(x1), r1=204(y1), r2=82(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 204
LDI r2, 82
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
