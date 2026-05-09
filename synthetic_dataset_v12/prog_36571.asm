; DESCRIPTION: Composite: Draws a red line from (202, 228) to (226, 240) then Renders a purple box of size 61x18 starting at (305, 100).
; PLAN: r0=202(x1), r1=228(y1), r2=226(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=100(y), r7=61(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 228
LDI r2, 226
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 100
LDI r7, 61
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
