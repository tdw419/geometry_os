; DESCRIPTION: Composite: Renders a green box of size 82x80 starting at (371, 52) then Draws a magenta circle centered at (82, 127) with radius 63 then Sets a single purple pixel at (418, 215).
; PLAN: r0=371(x), r1=52(y), r2=82(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=127(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x), r11=215(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 52
LDI r2, 82
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 127
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 215
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
