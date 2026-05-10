; DESCRIPTION: Composite: Draws a yellow line from (221, 79) to (141, 74) then Places a cyan 88x16 rectangle at position (231, 236).
; PLAN: r0=221(x1), r1=79(y1), r2=141(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=236(y), r7=88(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 79
LDI r2, 141
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 236
LDI r7, 88
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
