; DESCRIPTION: Composite: Places a magenta dot at position (394, 124) then Draws a black line from (261, 34) to (403, 135).
; PLAN: r0=394(x), r1=124(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=34(y1), r7=403(x2), r8=135(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 124
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 34
LDI r7, 403
LDI r8, 135
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
