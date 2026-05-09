; DESCRIPTION: Composite: . Then Places a black 65x32 rectangle at position (112, 135). Then Draws a green line from (217, 8) to (236, 178).
; PLAN: r0=112(x), r1=135(y), r2=65(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=217(x1), r1=8(y1), r2=236(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 65x32 rectangle at position (112, 135).
; PLAN: r0=112(x), r1=135(y), r2=65(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 135
LDI r2, 65
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (217, 8) to (236, 178).
; PLAN: r0=217(x1), r1=8(y1), r2=236(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 8
LDI r2, 236
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
