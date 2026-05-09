; DESCRIPTION: Composite: Places a magenta dot at position (458, 194) then Renders a black line between points (434, 107) and (123, 254).
; PLAN: r0=458(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=107(y1), r7=123(x2), r8=254(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 194
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 107
LDI r7, 123
LDI r8, 254
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
