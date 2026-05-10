; DESCRIPTION: Composite: Places a magenta line segment connecting (202, 181) to (267, 244) then Renders a cyan box of size 53x47 starting at (223, 131).
; PLAN: r0=202(x1), r1=181(y1), r2=267(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=131(y), r7=53(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 181
LDI r2, 267
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 131
LDI r7, 53
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
