; DESCRIPTION: Draws a cyan line from (82, 77) to (156, 228).
; PLAN: r0=82(x1), r1=77(y1), r2=156(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 77
LDI r2, 156
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
