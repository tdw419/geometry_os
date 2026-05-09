; DESCRIPTION: Composite: Draws a green line from (306, 160) to (257, 191) then Places a green 72x92 rectangle at position (386, 151).
; PLAN: r0=306(x1), r1=160(y1), r2=257(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=151(y), r7=72(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 160
LDI r2, 257
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 151
LDI r7, 72
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
