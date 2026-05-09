; DESCRIPTION: Composite: . Then Draws a cyan line from (7, 121) to (33, 186). Then Places a red 90x16 rectangle at position (21, 88).
; PLAN: r0=7(x1), r1=121(y1), r2=33(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=88(y), r2=90(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (7, 121) to (33, 186).
; PLAN: r0=7(x1), r1=121(y1), r2=33(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 121
LDI r2, 33
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 90x16 rectangle at position (21, 88).
; PLAN: r0=21(x), r1=88(y), r2=90(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 88
LDI r2, 90
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
