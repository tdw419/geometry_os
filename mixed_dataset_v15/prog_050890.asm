; DESCRIPTION: Composite: Draws a magenta line from (467, 130) to (403, 45) then Places a red dot at position (168, 10).
; PLAN: r0=467(x1), r1=130(y1), r2=403(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=10(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 467
LDI r1, 130
LDI r2, 403
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 10
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
