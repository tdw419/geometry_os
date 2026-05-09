; DESCRIPTION: Composite: Renders a blue line between points (254, 67) and (480, 50) then Places a orange dot at position (20, 247).
; PLAN: r0=254(x1), r1=67(y1), r2=480(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=247(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 67
LDI r2, 480
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 247
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
