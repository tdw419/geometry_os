; DESCRIPTION: Composite: Sets a single white pixel at (187, 59) then Places a blue line segment connecting (168, 87) to (108, 24).
; PLAN: r0=187(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=168(x1), r6=87(y1), r7=108(x2), r8=24(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 87
LDI r7, 108
LDI r8, 24
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
