; DESCRIPTION: Composite: Places a blue 111x107 rectangle at position (50, 127) then Draws a orange line from (39, 137) to (242, 185).
; PLAN: r0=50(x), r1=127(y), r2=111(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x1), r6=137(y1), r7=242(x2), r8=185(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 127
LDI r2, 111
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 137
LDI r7, 242
LDI r8, 185
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
