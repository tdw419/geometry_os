; DESCRIPTION: Composite: Places a magenta dot at position (262, 70) then Renders a cyan line between points (189, 105) and (321, 124).
; PLAN: r0=262(x), r1=70(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=105(y1), r7=321(x2), r8=124(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 70
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 105
LDI r7, 321
LDI r8, 124
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
