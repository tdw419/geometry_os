; DESCRIPTION: Composite: Renders a white box of size 88x39 starting at (313, 130) then Places a cyan dot at position (269, 1) then Renders a green line between points (204, 6) and (8, 45).
; PLAN: r0=313(x), r1=130(y), r2=88(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=1(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=204(x1), r11=6(y1), r12=8(x2), r13=45(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 130
LDI r2, 88
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 1
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 6
LDI r12, 8
LDI r13, 45
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
