; DESCRIPTION: Composite: Places a black dot at position (105, 59) then Places a black line segment connecting (228, 146) to (243, 219).
; PLAN: r0=105(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=228(x1), r6=146(y1), r7=243(x2), r8=219(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 228
LDI r6, 146
LDI r7, 243
LDI r8, 219
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
