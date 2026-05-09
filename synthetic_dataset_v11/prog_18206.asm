; DESCRIPTION: Renders a white line between points (178, 207) and (126, 113).
; PLAN: r0=178(x1), r1=207(y1), r2=126(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 207
LDI r2, 126
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
