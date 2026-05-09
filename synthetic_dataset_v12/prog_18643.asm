; DESCRIPTION: Composite: Places a red dot at position (313, 189) then Places a cyan line segment connecting (187, 251) to (281, 130) then Renders a yellow box of size 10x14 starting at (415, 107).
; PLAN: r0=313(x), r1=189(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=187(x1), r6=251(y1), r7=281(x2), r8=130(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=415(x), r11=107(y), r12=10(width), r13=14(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 189
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 187
LDI r6, 251
LDI r7, 281
LDI r8, 130
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 107
LDI r12, 10
LDI r13, 14
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
