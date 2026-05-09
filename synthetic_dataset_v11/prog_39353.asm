; DESCRIPTION: Renders a white line between points (63, 213) and (210, 215).
; PLAN: r0=63(x1), r1=213(y1), r2=210(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 213
LDI r2, 210
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
