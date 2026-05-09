; DESCRIPTION: Composite: Places a green line segment connecting (439, 92) to (137, 253) then Places a green dot at position (294, 107) then Places a yellow 68x109 rectangle at position (206, 42).
; PLAN: r0=439(x1), r1=92(y1), r2=137(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=107(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=42(y), r12=68(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 92
LDI r2, 137
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 107
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 206
LDI r11, 42
LDI r12, 68
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
