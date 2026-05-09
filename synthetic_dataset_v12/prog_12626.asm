; DESCRIPTION: Composite: Places a cyan dot at position (385, 63) then Renders a yellow line between points (68, 157) and (253, 98) then Renders a cyan box of size 86x56 starting at (103, 130).
; PLAN: r0=385(x), r1=63(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=68(x1), r6=157(y1), r7=253(x2), r8=98(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=130(y), r12=86(width), r13=56(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 63
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 157
LDI r7, 253
LDI r8, 98
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 130
LDI r12, 86
LDI r13, 56
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
