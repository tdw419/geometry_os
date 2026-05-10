; DESCRIPTION: Composite: Places a magenta line segment connecting (67, 134) to (63, 57) then Sets a single cyan pixel at (297, 126) then Places a white 60x42 rectangle at position (80, 66).
; PLAN: r0=67(x1), r1=134(y1), r2=63(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=126(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=66(y), r12=60(width), r13=42(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 134
LDI r2, 63
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 126
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 80
LDI r11, 66
LDI r12, 60
LDI r13, 42
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
