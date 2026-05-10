; DESCRIPTION: Composite: Places a white dot at position (23, 150) then Renders a white line between points (446, 12) and (265, 10).
; PLAN: r0=23(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=12(y1), r7=265(x2), r8=10(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 446
LDI r6, 12
LDI r7, 265
LDI r8, 10
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
