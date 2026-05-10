; DESCRIPTION: Composite: Places a green dot at position (225, 194) then Renders a cyan box of size 45x25 starting at (326, 72) then Renders a magenta disk with center (361, 52) and radius 10.
; PLAN: r0=225(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=72(y), r7=45(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=361(x), r11=52(y), r12=10(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 326
LDI r6, 72
LDI r7, 45
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 52
LDI r12, 10
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
