; DESCRIPTION: Composite: Sets a single white pixel at (327, 119) then Places a cyan line segment connecting (36, 146) to (197, 202) then Places a green 120x49 rectangle at position (32, 128).
; PLAN: r0=327(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=36(x1), r6=146(y1), r7=197(x2), r8=202(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=128(y), r12=120(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 146
LDI r7, 197
LDI r8, 202
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 128
LDI r12, 120
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
