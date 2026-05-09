; DESCRIPTION: Composite: Places a orange dot at position (245, 124) then Draws a white line from (426, 206) to (294, 95).
; PLAN: r0=245(x), r1=124(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=206(y1), r7=294(x2), r8=95(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 124
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 426
LDI r6, 206
LDI r7, 294
LDI r8, 95
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
