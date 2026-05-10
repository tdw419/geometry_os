; DESCRIPTION: Composite: Renders a green line between points (12, 78) and (367, 146) then Draws a magenta circle centered at (292, 154) with radius 75 then Sets a single cyan pixel at (292, 190).
; PLAN: r0=12(x1), r1=78(y1), r2=367(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=154(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=190(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 78
LDI r2, 367
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 154
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 190
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
