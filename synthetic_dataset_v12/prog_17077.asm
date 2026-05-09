; DESCRIPTION: Composite: Places a magenta dot at position (356, 40) then Places a green circle of radius 42 at center (63, 67) then Draws a cyan line from (182, 194) to (467, 235).
; PLAN: r0=356(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=67(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x1), r11=194(y1), r12=467(x2), r13=235(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 67
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 194
LDI r12, 467
LDI r13, 235
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
