; DESCRIPTION: Composite: Places a black line segment connecting (479, 129) to (201, 73) then Places a black dot at position (467, 28) then Renders a blue box of size 63x23 starting at (180, 9).
; PLAN: r0=479(x1), r1=129(y1), r2=201(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=28(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=9(y), r12=63(width), r13=23(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 129
LDI r2, 201
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 28
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 180
LDI r11, 9
LDI r12, 63
LDI r13, 23
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
