; DESCRIPTION: Composite: . Then Draws a white line from (53, 213) to (111, 210). Then Renders a white box of size 51x57 starting at (162, 0).
; PLAN: r0=53(x1), r1=213(y1), r2=111(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=0(y), r2=51(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (53, 213) to (111, 210).
; PLAN: r0=53(x1), r1=213(y1), r2=111(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 213
LDI r2, 111
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white box of size 51x57 starting at (162, 0).
; PLAN: r0=162(x), r1=0(y), r2=51(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 0
LDI r2, 51
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
