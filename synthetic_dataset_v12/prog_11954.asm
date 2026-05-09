; DESCRIPTION: Composite: Draws a cyan line from (197, 169) to (282, 21) then Places a blue 15x70 rectangle at position (433, 132).
; PLAN: r0=197(x1), r1=169(y1), r2=282(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=132(y), r7=15(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 169
LDI r2, 282
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 132
LDI r7, 15
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
