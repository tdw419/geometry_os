; DESCRIPTION: Composite: Creates a purple circular shape at (272, 177) with radius 68 then Draws a cyan line from (446, 239) to (277, 12).
; PLAN: r0=272(x), r1=177(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x1), r6=239(y1), r7=277(x2), r8=12(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 177
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 239
LDI r7, 277
LDI r8, 12
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
