; DESCRIPTION: Draws a cyan line from (159, 62) to (245, 228).
; PLAN: r0=159(x1), r1=62(y1), r2=245(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 62
LDI r2, 245
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
