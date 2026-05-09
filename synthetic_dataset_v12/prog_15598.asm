; DESCRIPTION: Draws a red line from (480, 182) to (298, 154).
; PLAN: r0=480(x1), r1=182(y1), r2=298(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 182
LDI r2, 298
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
