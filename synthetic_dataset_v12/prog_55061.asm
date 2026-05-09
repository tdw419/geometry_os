; DESCRIPTION: Composite: Draws a black line from (40, 79) to (270, 35) then Renders a magenta box of size 36x30 starting at (386, 33).
; PLAN: r0=40(x1), r1=79(y1), r2=270(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=33(y), r7=36(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 79
LDI r2, 270
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 33
LDI r7, 36
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
