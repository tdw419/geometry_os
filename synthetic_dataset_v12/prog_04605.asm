; DESCRIPTION: Draws a white line from (208, 24) to (494, 228).
; PLAN: r0=208(x1), r1=24(y1), r2=494(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 24
LDI r2, 494
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
