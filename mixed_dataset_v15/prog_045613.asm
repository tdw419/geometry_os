; DESCRIPTION: Composite: Places a magenta dot at position (191, 127) then Renders a blue disk with center (72, 111) and radius 41 then Places a purple line segment connecting (39, 196) to (281, 60).
; PLAN: r0=191(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=111(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x1), r11=196(y1), r12=281(x2), r13=60(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 111
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 196
LDI r12, 281
LDI r13, 60
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
