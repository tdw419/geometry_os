; DESCRIPTION: Draws a red line from (326, 10) to (228, 103).
; PLAN: r0=326(x1), r1=10(y1), r2=228(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 10
LDI r2, 228
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
