; DESCRIPTION: Composite: Places a magenta dot at position (233, 181) then Renders a black box of size 61x93 starting at (335, 139) then Draws a cyan line from (301, 124) to (380, 241).
; PLAN: r0=233(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=139(y), r7=61(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x1), r11=124(y1), r12=380(x2), r13=241(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 139
LDI r7, 61
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 124
LDI r12, 380
LDI r13, 241
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
