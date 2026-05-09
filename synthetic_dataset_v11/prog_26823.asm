; DESCRIPTION: Composite: . Then Renders a cyan box of size 51x68 starting at (135, 176). Then Draws a black line from (202, 51) to (37, 11).
; PLAN: r0=135(x), r1=176(y), r2=51(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=202(x1), r1=51(y1), r2=37(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 51x68 starting at (135, 176).
; PLAN: r0=135(x), r1=176(y), r2=51(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 176
LDI r2, 51
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (202, 51) to (37, 11).
; PLAN: r0=202(x1), r1=51(y1), r2=37(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 51
LDI r2, 37
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
