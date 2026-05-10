; DESCRIPTION: Composite: Places a red dot at position (64, 76) then Draws a yellow line from (92, 157) to (218, 5).
; PLAN: r0=64(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=157(y1), r7=218(x2), r8=5(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 92
LDI r6, 157
LDI r7, 218
LDI r8, 5
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
