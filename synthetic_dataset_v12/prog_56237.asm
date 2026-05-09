; DESCRIPTION: Composite: Places a cyan dot at position (243, 204) then Draws a cyan line from (326, 254) to (189, 77).
; PLAN: r0=243(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=326(x1), r6=254(y1), r7=189(x2), r8=77(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 254
LDI r7, 189
LDI r8, 77
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
