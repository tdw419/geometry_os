; DESCRIPTION: Composite: Sets a single magenta pixel at (67, 245) then Renders a white line between points (428, 153) and (293, 174).
; PLAN: r0=67(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=428(x1), r6=153(y1), r7=293(x2), r8=174(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 153
LDI r7, 293
LDI r8, 174
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
