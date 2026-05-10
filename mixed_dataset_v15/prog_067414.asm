; DESCRIPTION: Composite: Draws a cyan line from (460, 54) to (481, 126) then Renders a magenta disk with center (42, 94) and radius 35.
; PLAN: r0=460(x1), r1=54(y1), r2=481(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=94(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 54
LDI r2, 481
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 94
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
