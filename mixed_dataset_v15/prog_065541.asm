; DESCRIPTION: Draws a cyan line from (262, 204) to (159, 255).
; PLAN: r0=262(x1), r1=204(y1), r2=159(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 204
LDI r2, 159
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
