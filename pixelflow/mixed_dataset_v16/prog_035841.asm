; DESCRIPTION: Composite: Places a black dot at position (234, 46) then Draws a green line from (167, 164) to (344, 219).
; PLAN: r0=234(x), r1=46(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=164(y1), r7=344(x2), r8=219(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 46
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 167
LDI r6, 164
LDI r7, 344
LDI r8, 219
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
