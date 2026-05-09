; DESCRIPTION: Composite: Renders a cyan box of size 79x92 starting at (176, 113) then Draws a blue line from (431, 6) to (337, 55) then Places a orange dot at position (218, 243).
; PLAN: r0=176(x), r1=113(y), r2=79(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x1), r6=6(y1), r7=337(x2), r8=55(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=218(x), r11=243(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 113
LDI r2, 79
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 6
LDI r7, 337
LDI r8, 55
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 243
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
