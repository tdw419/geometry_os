; DESCRIPTION: Composite: Draws a white line from (176, 249) to (219, 228) then Places a black circle of radius 68 at center (182, 111).
; PLAN: r0=176(x1), r1=249(y1), r2=219(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=111(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 249
LDI r2, 219
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 111
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
