; DESCRIPTION: Composite: Places a green line segment connecting (485, 10) to (491, 48) then Places a magenta circle of radius 32 at center (140, 177).
; PLAN: r0=485(x1), r1=10(y1), r2=491(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=177(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 485
LDI r1, 10
LDI r2, 491
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 177
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
