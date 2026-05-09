; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (112, 65). Then Draws a magenta line from (192, 116) to (109, 128).
; PLAN: r0=112(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=192(x1), r1=116(y1), r2=109(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (112, 65).
; PLAN: r0=112(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 65
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (192, 116) to (109, 128).
; PLAN: r0=192(x1), r1=116(y1), r2=109(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 116
LDI r2, 109
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
