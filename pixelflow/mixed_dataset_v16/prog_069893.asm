; DESCRIPTION: Composite: Places a red circle of radius 77 at center (331, 111) then Places a purple dot at position (126, 64) then Places a blue 94x115 rectangle at position (236, 57).
; PLAN: r0=331(x), r1=111(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=64(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=236(x), r11=57(y), r12=94(width), r13=115(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 111
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 64
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 236
LDI r11, 57
LDI r12, 94
LDI r13, 115
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
