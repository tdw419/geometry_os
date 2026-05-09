; DESCRIPTION: Composite: Places a yellow line segment connecting (348, 177) to (213, 206) then Renders a blue box of size 27x54 starting at (392, 63) then Sets a single red pixel at (70, 210).
; PLAN: r0=348(x1), r1=177(y1), r2=213(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=63(y), r7=27(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x), r11=210(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 177
LDI r2, 213
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 63
LDI r7, 27
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 210
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
