; DESCRIPTION: Composite: Draws a green circle centered at (199, 97) with radius 11 then Draws a cyan line from (114, 116) to (349, 117) then Sets a single magenta pixel at (243, 210).
; PLAN: r0=199(x), r1=97(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x1), r6=116(y1), r7=349(x2), r8=117(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=210(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 97
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 116
LDI r7, 349
LDI r8, 117
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 210
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
