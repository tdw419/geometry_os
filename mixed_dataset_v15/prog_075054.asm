; DESCRIPTION: Composite: Renders a cyan box of size 25x26 starting at (422, 128) then Renders a red line between points (384, 222) and (447, 3).
; PLAN: r0=422(x), r1=128(y), r2=25(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x1), r6=222(y1), r7=447(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 128
LDI r2, 25
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 222
LDI r7, 447
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
