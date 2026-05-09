; DESCRIPTION: Composite: Places a red line segment connecting (221, 181) to (165, 234) then Places a magenta dot at position (113, 213).
; PLAN: r0=221(x1), r1=181(y1), r2=165(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=213(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 181
LDI r2, 165
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 213
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
