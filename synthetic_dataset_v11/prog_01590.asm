; DESCRIPTION: Composite: . Then Places a green 33x42 rectangle at position (106, 197). Then Draws a white line from (61, 14) to (38, 134).
; PLAN: r0=106(x), r1=197(y), r2=33(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=61(x1), r1=14(y1), r2=38(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 33x42 rectangle at position (106, 197).
; PLAN: r0=106(x), r1=197(y), r2=33(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 197
LDI r2, 33
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (61, 14) to (38, 134).
; PLAN: r0=61(x1), r1=14(y1), r2=38(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 14
LDI r2, 38
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
