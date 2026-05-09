; DESCRIPTION: Renders a white line between points (418, 38) and (228, 113).
; PLAN: r0=418(x1), r1=38(y1), r2=228(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 38
LDI r2, 228
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
