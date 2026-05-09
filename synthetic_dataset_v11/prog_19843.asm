; DESCRIPTION: Draws a red line from (57, 199) to (242, 228).
; PLAN: r0=57(x1), r1=199(y1), r2=242(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 199
LDI r2, 242
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
