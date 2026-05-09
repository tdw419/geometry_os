; DESCRIPTION: Composite: Places a cyan dot at position (370, 128) then Renders a magenta line between points (239, 41) and (114, 126).
; PLAN: r0=370(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=239(x1), r6=41(y1), r7=114(x2), r8=126(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 41
LDI r7, 114
LDI r8, 126
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
