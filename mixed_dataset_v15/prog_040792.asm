; DESCRIPTION: Composite: Places a black line segment connecting (7, 228) to (382, 186) then Renders a cyan box of size 98x108 starting at (239, 42) then Places a yellow circle of radius 36 at center (123, 213).
; PLAN: r0=7(x1), r1=228(y1), r2=382(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=42(y), r7=98(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=213(y), r12=36(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 228
LDI r2, 382
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 42
LDI r7, 98
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 213
LDI r12, 36
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
