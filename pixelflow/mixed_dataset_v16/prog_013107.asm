; DESCRIPTION: Composite: Renders a white line between points (495, 60) and (310, 245) then Places a magenta circle of radius 46 at center (173, 177).
; PLAN: r0=495(x1), r1=60(y1), r2=310(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=177(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 60
LDI r2, 310
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 177
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
