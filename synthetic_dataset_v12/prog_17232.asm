; DESCRIPTION: Composite: Sets a single yellow pixel at (187, 91) then Renders a yellow box of size 68x120 starting at (60, 51) then Draws a cyan line from (134, 57) to (198, 25).
; PLAN: r0=187(x), r1=91(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=51(y), r7=68(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x1), r11=57(y1), r12=198(x2), r13=25(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 91
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 60
LDI r6, 51
LDI r7, 68
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 57
LDI r12, 198
LDI r13, 25
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
