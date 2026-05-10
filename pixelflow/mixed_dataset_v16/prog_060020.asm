; DESCRIPTION: Composite: Creates a cyan circular shape at (156, 146) with radius 55 then Sets a single purple pixel at (174, 231) then Renders a green box of size 32x25 starting at (362, 57).
; PLAN: r0=156(x), r1=146(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=57(y), r12=32(width), r13=25(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 146
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 362
LDI r11, 57
LDI r12, 32
LDI r13, 25
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
