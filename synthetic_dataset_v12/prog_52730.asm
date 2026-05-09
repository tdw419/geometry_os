; DESCRIPTION: Composite: Draws a cyan line from (236, 20) to (309, 60) then Places a white 32x86 rectangle at position (394, 94).
; PLAN: r0=236(x1), r1=20(y1), r2=309(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=94(y), r7=32(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 20
LDI r2, 309
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 94
LDI r7, 32
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
