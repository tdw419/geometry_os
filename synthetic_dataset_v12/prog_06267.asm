; DESCRIPTION: Composite: Places a black 93x93 rectangle at position (336, 103) then Draws a red line from (218, 73) to (91, 100).
; PLAN: r0=336(x), r1=103(y), r2=93(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x1), r6=73(y1), r7=91(x2), r8=100(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 103
LDI r2, 93
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 73
LDI r7, 91
LDI r8, 100
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
