; DESCRIPTION: Composite: Places a orange line segment connecting (152, 30) to (193, 28) then Places a magenta circle of radius 74 at center (362, 82).
; PLAN: r0=152(x1), r1=30(y1), r2=193(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=82(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 152
LDI r1, 30
LDI r2, 193
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 82
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
