; DESCRIPTION: Draws a black line from (166, 228) to (248, 16).
; PLAN: r0=166(x1), r1=228(y1), r2=248(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 228
LDI r2, 248
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
