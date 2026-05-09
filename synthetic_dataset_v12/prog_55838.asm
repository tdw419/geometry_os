; DESCRIPTION: Composite: Places a magenta dot at position (447, 219) then Draws a white line from (404, 124) to (80, 46).
; PLAN: r0=447(x), r1=219(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=404(x1), r6=124(y1), r7=80(x2), r8=46(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 219
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 124
LDI r7, 80
LDI r8, 46
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
