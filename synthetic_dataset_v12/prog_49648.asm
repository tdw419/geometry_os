; DESCRIPTION: Renders a cyan line between points (261, 213) and (440, 223).
; PLAN: r0=261(x1), r1=213(y1), r2=440(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 213
LDI r2, 440
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
