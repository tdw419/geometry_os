; DESCRIPTION: Composite: Places a green 36x30 rectangle at position (307, 151) then Draws a green line from (240, 51) to (470, 127).
; PLAN: r0=307(x), r1=151(y), r2=36(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=51(y1), r7=470(x2), r8=127(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 151
LDI r2, 36
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 51
LDI r7, 470
LDI r8, 127
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
