; DESCRIPTION: Composite: Draws a cyan line from (173, 181) to (200, 92) then Draws a red circle centered at (146, 171) with radius 61 then Places a cyan dot at position (18, 243).
; PLAN: r0=173(x1), r1=181(y1), r2=200(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=171(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=243(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 181
LDI r2, 200
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 171
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 243
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
