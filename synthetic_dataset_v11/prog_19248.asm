; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (175, 146) to (116, 50). Then Places a white dot at position (81, 236).
; PLAN: r0=175(x1), r1=146(y1), r2=116(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (175, 146) to (116, 50).
; PLAN: r0=175(x1), r1=146(y1), r2=116(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 116
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (81, 236).
; PLAN: r0=81(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
