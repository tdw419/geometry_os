; DESCRIPTION: Draws a cyan line from (118, 248) to (2, 228).
; PLAN: r0=118(x1), r1=248(y1), r2=2(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 248
LDI r2, 2
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
