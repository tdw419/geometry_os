; DESCRIPTION: Composite: . Then Places a cyan 79x68 rectangle at position (165, 184). Then Draws a white line from (186, 169) to (148, 178).
; PLAN: r0=165(x), r1=184(y), r2=79(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=186(x1), r1=169(y1), r2=148(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 79x68 rectangle at position (165, 184).
; PLAN: r0=165(x), r1=184(y), r2=79(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 184
LDI r2, 79
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (186, 169) to (148, 178).
; PLAN: r0=186(x1), r1=169(y1), r2=148(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 169
LDI r2, 148
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
