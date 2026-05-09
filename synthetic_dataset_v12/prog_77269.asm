; DESCRIPTION: Renders a green line between points (296, 42) and (175, 204).
; PLAN: r0=296(x1), r1=42(y1), r2=175(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 42
LDI r2, 175
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
