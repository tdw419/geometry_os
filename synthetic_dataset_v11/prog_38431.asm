; DESCRIPTION: Composite: . Then Renders a red line between points (103, 148) and (73, 166). Then Places a red 75x59 rectangle at position (12, 126).
; PLAN: r0=103(x1), r1=148(y1), r2=73(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=12(x), r1=126(y), r2=75(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (103, 148) and (73, 166).
; PLAN: r0=103(x1), r1=148(y1), r2=73(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 148
LDI r2, 73
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 75x59 rectangle at position (12, 126).
; PLAN: r0=12(x), r1=126(y), r2=75(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 126
LDI r2, 75
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
