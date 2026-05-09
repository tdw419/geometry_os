; DESCRIPTION: Draws a cyan line from (345, 68) to (420, 228).
; PLAN: r0=345(x1), r1=68(y1), r2=420(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 68
LDI r2, 420
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
