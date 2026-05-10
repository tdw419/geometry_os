; DESCRIPTION: Composite: Sets a single cyan pixel at (1, 93) then Draws a cyan line from (459, 14) to (431, 111) then Renders a magenta box of size 120x76 starting at (40, 156).
; PLAN: r0=1(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=14(y1), r7=431(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=156(y), r12=120(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 459
LDI r6, 14
LDI r7, 431
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 156
LDI r12, 120
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
