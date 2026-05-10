; DESCRIPTION: Composite: Places a magenta dot at position (94, 121) then Renders a green line between points (245, 253) and (54, 241).
; PLAN: r0=94(x), r1=121(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=245(x1), r6=253(y1), r7=54(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 121
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 253
LDI r7, 54
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
