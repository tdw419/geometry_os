; DESCRIPTION: Draws a cyan line from (272, 228) to (375, 77).
; PLAN: r0=272(x1), r1=228(y1), r2=375(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 228
LDI r2, 375
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
