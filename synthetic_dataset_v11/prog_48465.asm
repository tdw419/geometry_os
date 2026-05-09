; DESCRIPTION: Composite: . Then Draws a green line from (39, 171) to (236, 1). Then Places a white 95x61 rectangle at position (6, 133).
; PLAN: r0=39(x1), r1=171(y1), r2=236(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=6(x), r1=133(y), r2=95(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (39, 171) to (236, 1).
; PLAN: r0=39(x1), r1=171(y1), r2=236(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 171
LDI r2, 236
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 95x61 rectangle at position (6, 133).
; PLAN: r0=6(x), r1=133(y), r2=95(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 133
LDI r2, 95
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
