; DESCRIPTION: Draws a orange line from (197, 228) to (12, 27).
; PLAN: r0=197(x1), r1=228(y1), r2=12(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 228
LDI r2, 12
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
