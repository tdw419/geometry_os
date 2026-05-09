; DESCRIPTION: Composite: Renders a blue line between points (460, 80) and (193, 142) then Renders a purple box of size 116x32 starting at (300, 19).
; PLAN: r0=460(x1), r1=80(y1), r2=193(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=19(y), r7=116(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 80
LDI r2, 193
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 19
LDI r7, 116
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
