; DESCRIPTION: Composite: Renders a cyan disk with center (371, 62) and radius 55 then Draws a blue line from (168, 114) to (182, 95) then Sets a single magenta pixel at (231, 56).
; PLAN: r0=371(x), r1=62(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x1), r6=114(y1), r7=182(x2), r8=95(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=56(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 62
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 114
LDI r7, 182
LDI r8, 95
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 56
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
