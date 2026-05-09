; DESCRIPTION: Composite: Renders a yellow box of size 70x64 starting at (248, 4) then Sets a single cyan pixel at (209, 206).
; PLAN: r0=248(x), r1=4(y), r2=70(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=206(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 4
LDI r2, 70
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 206
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
