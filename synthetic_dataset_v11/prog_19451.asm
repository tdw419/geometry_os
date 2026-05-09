; DESCRIPTION: Composite: . Then Places a yellow 47x64 rectangle at position (74, 143). Then Draws a green line from (27, 162) to (208, 213).
; PLAN: r0=74(x), r1=143(y), r2=47(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=27(x1), r1=162(y1), r2=208(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow 47x64 rectangle at position (74, 143).
; PLAN: r0=74(x), r1=143(y), r2=47(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 143
LDI r2, 47
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (27, 162) to (208, 213).
; PLAN: r0=27(x1), r1=162(y1), r2=208(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 162
LDI r2, 208
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
