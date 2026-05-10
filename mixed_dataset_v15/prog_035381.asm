; DESCRIPTION: Composite: Places a white 22x97 rectangle at position (321, 107) then Sets a single purple pixel at (307, 56) then Renders a cyan line between points (346, 229) and (392, 251).
; PLAN: r0=321(x), r1=107(y), r2=22(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=56(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=346(x1), r11=229(y1), r12=392(x2), r13=251(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 107
LDI r2, 22
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 56
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 346
LDI r11, 229
LDI r12, 392
LDI r13, 251
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
