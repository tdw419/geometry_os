; DESCRIPTION: Composite: . Then Draws a magenta line from (243, 255) to (88, 69). Then Sets a single purple pixel at (59, 171).
; PLAN: r0=243(x1), r1=255(y1), r2=88(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=59(x), r1=171(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (243, 255) to (88, 69).
; PLAN: r0=243(x1), r1=255(y1), r2=88(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 255
LDI r2, 88
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (59, 171).
; PLAN: r0=59(x), r1=171(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 171
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
