; DESCRIPTION: Composite: Renders a green box of size 111x82 starting at (265, 25) then Draws a red line from (85, 247) to (435, 222) then Places a cyan dot at position (72, 12).
; PLAN: r0=265(x), r1=25(y), r2=111(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=247(y1), r7=435(x2), r8=222(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=12(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 25
LDI r2, 111
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 247
LDI r7, 435
LDI r8, 222
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 12
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
