; DESCRIPTION: Draws a cyan line from (321, 228) to (165, 82).
; PLAN: r0=321(x1), r1=228(y1), r2=165(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 228
LDI r2, 165
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
