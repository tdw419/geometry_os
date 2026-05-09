; DESCRIPTION: Composite: Places a cyan dot at position (465, 70) then Renders a magenta box of size 75x28 starting at (302, 219) then Draws a white line from (167, 246) to (464, 22).
; PLAN: r0=465(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=219(y), r7=75(width), r8=28(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x1), r11=246(y1), r12=464(x2), r13=22(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 219
LDI r7, 75
LDI r8, 28
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 246
LDI r12, 464
LDI r13, 22
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
