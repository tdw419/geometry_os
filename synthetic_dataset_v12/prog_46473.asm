; DESCRIPTION: Composite: Places a yellow dot at position (476, 236) then Renders a cyan line between points (28, 166) and (210, 28).
; PLAN: r0=476(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=28(x1), r6=166(y1), r7=210(x2), r8=28(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 28
LDI r6, 166
LDI r7, 210
LDI r8, 28
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
