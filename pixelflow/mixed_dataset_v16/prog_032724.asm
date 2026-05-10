; DESCRIPTION: Composite: Places a purple dot at position (299, 21) then Renders a green line between points (127, 131) and (277, 103).
; PLAN: r0=299(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=131(y1), r7=277(x2), r8=103(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 131
LDI r7, 277
LDI r8, 103
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
