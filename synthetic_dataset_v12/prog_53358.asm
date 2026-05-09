; DESCRIPTION: Composite: Renders a black box of size 87x17 starting at (50, 207) then Draws a purple line from (506, 239) to (290, 137) then Places a cyan dot at position (371, 128).
; PLAN: r0=50(x), r1=207(y), r2=87(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x1), r6=239(y1), r7=290(x2), r8=137(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=128(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 207
LDI r2, 87
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 239
LDI r7, 290
LDI r8, 137
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 128
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
