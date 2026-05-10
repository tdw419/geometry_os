; DESCRIPTION: Composite: Renders a orange disk with center (367, 103) and radius 59 then Places a red dot at position (75, 209).
; PLAN: r0=367(x), r1=103(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=209(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 103
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 209
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
