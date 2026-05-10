; DESCRIPTION: Composite: Draws a cyan line from (87, 181) to (242, 169) then Places a green 46x60 rectangle at position (411, 109).
; PLAN: r0=87(x1), r1=181(y1), r2=242(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=109(y), r7=46(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 181
LDI r2, 242
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 109
LDI r7, 46
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
