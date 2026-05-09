; DESCRIPTION: Composite: Places a white dot at position (329, 45) then Renders a magenta line between points (479, 22) and (326, 12).
; PLAN: r0=329(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=479(x1), r6=22(y1), r7=326(x2), r8=12(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 479
LDI r6, 22
LDI r7, 326
LDI r8, 12
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
