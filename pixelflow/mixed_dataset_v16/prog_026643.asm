; DESCRIPTION: Composite: Renders a cyan box of size 19x26 starting at (310, 221) then Draws a purple line from (307, 209) to (140, 127).
; PLAN: r0=310(x), r1=221(y), r2=19(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=209(y1), r7=140(x2), r8=127(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 221
LDI r2, 19
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 209
LDI r7, 140
LDI r8, 127
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
