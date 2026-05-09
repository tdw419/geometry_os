; DESCRIPTION: Draws a green line from (230, 228) to (311, 213).
; PLAN: r0=230(x1), r1=228(y1), r2=311(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 228
LDI r2, 311
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
