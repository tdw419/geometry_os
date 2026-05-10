; DESCRIPTION: Composite: Renders a magenta box of size 47x37 starting at (62, 125) then Renders a cyan line between points (412, 188) and (129, 62) then Places a green dot at position (233, 146).
; PLAN: r0=62(x), r1=125(y), r2=47(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=188(y1), r7=129(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=146(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 62
LDI r1, 125
LDI r2, 47
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 188
LDI r7, 129
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 146
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
