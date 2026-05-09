; DESCRIPTION: Composite: . Then Places a black dot at position (207, 74). Then Renders a black line between points (219, 146) and (154, 190).
; PLAN: r0=207(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=219(x1), r1=146(y1), r2=154(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (207, 74).
; PLAN: r0=207(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (219, 146) and (154, 190).
; PLAN: r0=219(x1), r1=146(y1), r2=154(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 146
LDI r2, 154
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
