; DESCRIPTION: Draws a red line from (242, 28) to (276, 240).
; PLAN: r0=242(x1), r1=28(y1), r2=276(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 28
LDI r2, 276
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
