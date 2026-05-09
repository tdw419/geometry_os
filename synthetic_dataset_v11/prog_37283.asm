; DESCRIPTION: Composite: . Then Draws a white line from (31, 186) to (74, 104). Then Places a yellow 31x74 rectangle at position (16, 47).
; PLAN: r0=31(x1), r1=186(y1), r2=74(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=16(x), r1=47(y), r2=31(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (31, 186) to (74, 104).
; PLAN: r0=31(x1), r1=186(y1), r2=74(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 186
LDI r2, 74
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 31x74 rectangle at position (16, 47).
; PLAN: r0=16(x), r1=47(y), r2=31(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 47
LDI r2, 31
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
