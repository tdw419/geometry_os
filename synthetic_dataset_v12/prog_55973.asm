; DESCRIPTION: Composite: Sets a single blue pixel at (284, 135) then Creates a magenta circular shape at (46, 60) with radius 39 then Renders a magenta line between points (386, 83) and (227, 40).
; PLAN: r0=284(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=60(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x1), r11=83(y1), r12=227(x2), r13=40(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 60
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 83
LDI r12, 227
LDI r13, 40
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
