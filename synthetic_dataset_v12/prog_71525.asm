; DESCRIPTION: Composite: Renders a purple disk with center (182, 87) and radius 70 then Draws a cyan line from (28, 213) to (450, 132) then Sets a single purple pixel at (85, 63).
; PLAN: r0=182(x), r1=87(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x1), r6=213(y1), r7=450(x2), r8=132(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=63(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 87
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 213
LDI r7, 450
LDI r8, 132
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 63
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
